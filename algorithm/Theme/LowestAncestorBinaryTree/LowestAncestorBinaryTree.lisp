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

;; updated on 2016/07/05

;;                         1
;;                        / \
;;                       /   \
;;                      2     3
;;                     /\     /\
;;                    /  \   /  \
;;                   4   5  6    7
;;
;; LCA(4, 5) = 2
;; LCA(4, 6) = 1
;; LCA(3, 4) = 1
;; LCA(2, 4) = 2

(format t "--------~%")

(defparameter another-root (create-node 3))
(setf (left-child another-root) (create-node 6))
(setf (right-child another-root) (create-node 8))

(setf (left-child (left-child another-root)) (create-node 2))
(setf (right-child (left-child another-root)) (create-node 11))

(setf (right-child (right-child another-root)) (create-node 13))

(setf (left-child (right-child (left-child another-root))) (create-node
                                                    9))
(setf (right-child (right-child (left-child another-root))) (create-node
                                                     5))

(setf (left-child (right-child (right-child another-root))) (create-node
                                                     7))

(format t "LCA(2, 8) = ~d~%" (value (find-lowest-common-ancestor
                                     another-root 2 8)))
(format t "LCA(2, 5) = ~d~%" (value (find-lowest-common-ancestor
                                     another-root 2 5)))
(format t "LCA(9, 5) = ~d~%" (value (find-lowest-common-ancestor
                                     another-root 9 5)))
(format t "LCA(8, 7) = ~d~%" (value (find-lowest-common-ancestor
                                     another-root 8 7)))
(format t "LCA(9, 3) = ~d~%" (value (find-lowest-common-ancestor
                                     another-root 9 3)))

;;                       3
;;                      / \
;;                     /   \
;;                    6     8
;;                   / \     \
;;                  /   \     \
;;                 2    11    13
;;                      /\    /
;;                     /  \  /
;;                    9   5 7
;;
;; LCA(2, 8) = 3
;; LCA(2, 5) = 6
;; LCA(9, 5) = 11
;; LCA(8, 7) = 8
;; LCA(9, 3) = 3
;;
