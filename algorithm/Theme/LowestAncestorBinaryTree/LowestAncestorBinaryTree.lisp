(defclass tree-node ()
  ((value :initform nil
          :initarg :value
          :accessor value)
   (left :initform nil
         :accessor left-child)
   (right :initform nil
          :accessor right-child)))

(defun create-node (value)
  (let ((node (make-instance 'tree-node :value value)))
    node))

(defun find-lowest-common-ancestor (tree-node n1 n2)
  (if (null tree-node)
      (return-from find-lowest-common-ancestor nil))
  (if (or (equal n1 (value tree-node))
          (equal n2 (value tree-node)))
      (return-from find-lowest-common-ancestor tree-node))
  (let ((left (find-lowest-common-ancestor (left-child
                                            tree-node) n1 n2))
        (right (find-lowest-common-ancestor (right-child
                                             tree-node) n1 n2)))
    (if (and left right)
        (return-from find-lowest-common-ancestor tree-node))
    (or left right)))

(defparameter root (create-node 1))

(setf (left-child root) (create-node 2))
(setf (right-child root) (create-node 3))

(setf (left-child (left-child root)) (create-node 4))
(setf (right-child (left-child root)) (create-node 5))

(setf (left-child (right-child root)) (create-node 6))
(setf (right-child (right-child root)) (create-node 7))

(format t "LCA(4, 5) = ~d~%" (value (find-lowest-common-ancestor
                                     root 4 5)))
(format t "LCA(4, 6) = ~d~%" (value (find-lowest-common-ancestor
                                     root 4 6)))
(format t "LCA(3, 4) = ~d~%" (value (find-lowest-common-ancestor
                                     root 3 4)))
(format t "LCA(2, 4) = ~d~%" (value (find-lowest-common-ancestor
                                     root 2 4)))
