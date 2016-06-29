;; (defun AreaOfCircle ()
;;   (terpri)
;;   (princ "Enter Radius: ")
;;   (let ((radius 1))
;;     (setf radius (read))
;;     (format t "radius = ~d~%" radius)))

(with-open-file
    ;; this macro can auto close file.
    (*standard-output*
     "hello.output"
     :direction :output
     :if-exists :supersede)
  (loop for i from 10 to 15
        do (prin1 i)
           (princ " ")))

(with-open-file (*standard-output*
                 "Hello.output"
                 :direction :output
                 :if-exists :append)
  (dolist (item '('(1 2 3)
                  456
                  "a string"
                  '((a b)
                    (c d))))
    (print item)))
;; why there is an extra line!!!

(with-open-file (*standard-output*
                 "hello.output"
                 :direction :output
                 :if-exists :append)
  (dolist (item '(3 2 4 1 5))
    (format t "~d " item)))

(let ((in (open "hello.output")))
  (format t "~a~%" (read in))
  (close in))

;; it returns nil if the file does not exist.
(let ((in (open "Hell.output"
                :if-does-not-exist nil)))
  (when in
    (format t "~a~%" (read-line in nil))
    (close in)))

(let ((in (open "Hello.output"
                :if-does-not-exist nil)))
  (when in
    (format t "~&-----~%")
    (loop for line = (read in nil)
          while line
          do (if (numberp line)
                 (format t "~a, ~d~%" line (1+ line))
                 (format t "~a~%" line)))
    (close in)))

;; read by byte
(let ((my-stream (open "Hello.output"
                       :if-does-not-exist nil))
      (my-vec (make-sequence 'vector 10)))
  (when my-stream
    (read-sequence my-vec my-stream)
    (print my-vec)))
