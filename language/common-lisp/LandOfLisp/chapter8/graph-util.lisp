;; 2016/08/01 11:48:58 AM
;; Xueyang Liu

(defparameter *wizard-nodes*
  '((living-room (you are in the living-room.
                  a wizard is snoring loudly on the couch.))
    (garden (you are in a beautiful garden.
             there is a well in front of you.))
    (attic (you are in the attic.
            there is a giant welding torch in the corner.))))

(defparameter *wizard-edges*
  '((living-room
     (garden west door)
     (attic upstairs ladder))
    (garden
     (living-room east door))
    (attic
     (living-room downstairs ladder))))

(defun dot-name (sexp)
  (string-downcase
   (substitute-if #\_ (complement #'alphanumericp)
                  (prin1-to-string sexp))))

(defparameter *max-label-length* 30)

(defun dot-label (sexp)
  (if sexp
      (let ((s (write-to-string sexp
                                :pretty nil)))
        (if (> (length s)
               *max-label-length*)
            (concatenate 'string
                         (string-downcase
                          (subseq s
                                  0 (- *max-label-length* 3)))
                         "...")
            s))
      ""))

(defun nodes->dot (nodes)
  (mapc (lambda (sexp)
          (fresh-line)
          (princ (dot-name (car sexp)))
          (princ "[label=\"")
          (princ (dot-label sexp))
          (princ "\"];"))
        nodes))

(defun edges->dot (edges)
  (mapc (lambda (node)
          (mapc (lambda (edge)
                  (fresh-line)
                  (princ (dot-name (car node)))
                  (princ "->")
                  (princ (dot-name (car edge)))
                  (princ "[label=\"")
                  (princ (string-downcase
                          (prin1-to-string (cdr edge))))
                  (princ "\"];"))
                (cdr node)))
        edges))

(defun uedges->dot (edges)
  (maplist (lambda (lst)
             (mapc (lambda (edge)
                     (unless (assoc (car edge)
                                    lst)
                       (fresh-line)
                       (princ (dot-name (caar lst)))
                       (princ "--")
                       (princ (dot-name (car edge)))
                       (princ "[label=\"")
                       (princ (string-downcase
                               (prin1-to-string (cdr edge))))
                       (princ "\"];")))
                   (cdar lst)))
           edges))

(defun graph->dot (nodes edges)
  (princ "digraph{")
  (nodes->dot nodes)
  (edges->dot edges)
  (princ "}"))

(defun ugraph->dot (nodes edges)
  (princ "graph{")
  (nodes->dot nodes)
  (uedges->dot edges)
  (princ "}"))

(defun dot->png (fname thunk)
  (with-open-file (*standard-output*
                   fname
                   :direction :output
                   :if-exists :supersede)
    (funcall thunk))
  (ext:shell (concatenate 'string
                          "dot -Tpng -O " fname)))

(defun graph->png (fname nodes edges)
  (dot->png fname
            (lambda ()
              (graph->dot nodes edges))))

(defun ugraph->png (fname nodes edges)
  (dot->png fname
            (lambda ()
              (ugraph->dot nodes edges))))
