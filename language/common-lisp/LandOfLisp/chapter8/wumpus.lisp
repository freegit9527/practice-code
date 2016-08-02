(load "graph-util")

(defparameter *congestion-city-nodes* nil)
(defparameter *congestion-city-edges* nil)
(defparameter *visited-nodes* nil)
(defparameter *node-num* 30)
(defparameter *edge-num* 45)
(defparameter *worm-num* 3)
(defparameter *cop-odds* 15)

(defun random-node ()
  (1+ (random *node-num*)))

(defun edge-pair (a b)
  "Generate two directed edges for two nodes a and b."
  (unless (eql a b)
    `(,(cons a b) ,(cons b a))))

(defun make-edge-list ()
  "Generate a list of two times of *edge-num* directed edges
NOTE: edges may be duplicate"
  (apply #'append
         (loop repeat *edge-num*
               collect (edge-pair (random-node) (random-node)))))

(defun make-node-list (edge-list)
  "Generate a list of nodes from the edge-list"
  (let ((nodes nil))
    (mapc (lambda (edge)
            (unless (member (car edge)
                            nodes)
              (push (car edge) nodes)))
          edge-list)
    nodes))

(defun direct-edges (node edge-list)
  "for a node, return an edge list which directed starts from it."
  (remove-if (lambda (edge)
               (not (eql (car edge) node)))
             edge-list))

(defun get-connected (node edge-list)
  "return a list of nodes that directly or non-directly connected
to the node, including the node"
  (let ((visited nil))
    (labels ((traverse (current-node)
               (unless (member current-node visited)
                 (push current-node visited)
                 (mapc (lambda (edge)
                         (traverse (cdr edge)))
                       (direct-edges current-node edge-list)))))
      (traverse node)
      visited)))

(defun find-islands (nodes edge-list)
  "return a list of islands which is not connected with others"
  (let ((islands nil))
    (labels ((find-island (current-nodes)
               (let* ((connected (get-connected
                                  (car current-nodes) edge-list))
                      (unconnected (set-difference current-nodes
                                                   connected)))
                 (push connected islands)
                 (if unconnected
                     (find-island unconnected)))))
      (find-island nodes))
    islands))

(defun connected-with-bridges (islands)
  (if (cdr islands)
      (append (edge-pair (caar islands)
                         (caadr islands))
              (connected-with-bridges (cdr islands)))))

(defun connect-all-islands (nodes edge-list)
  (append (connect-with-bridges
           (find-islands nodes edge-list))
          edge-list))

(defun edges-to-alist (edge-list)
  (mapcar (lambda (node1)
            (cons node1
                  (mapcar (lambda (edge)
                            `(,(cdr edge)))
                          (remove-duplicates
                           (direct-edges node1
                                         edge-list)
                           :test #'equal))))
          (remove-duplicates (mapcar #'car edge-list))))

(defun add-cops (edge-alist edges-with-cops))
