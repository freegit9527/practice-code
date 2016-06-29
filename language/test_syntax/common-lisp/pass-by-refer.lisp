(defclass tree-node ()
  ((value :initform nil
          :initarg :value
          :accessor value)
   (left :initform nil
         :accessor left-child)
   (right :initform nil
          :accessor right-child)))

(defmethod create-node (value)
  (let ((node (make-instance 'tree-node :value value)))
    node))

(defparameter my-root (create-node 233))

(value my-root)

(defun foo-pass (tree-node)
  (setf (left-child tree-node) (create-node 466)))

(defun bar-pass (tree-node)
  (setf tree-node (create-node 466)))

(defun slot-pass (tree-node)
  (setf (value tree-node) 1010)
  (setf (right-child tree-node) (create-node 1111))
  (setf (left-child tree-node) (create-node 22222)))
