;; Finished at 2016/07/07 7:51:23 AM

(defvar *n*)
(defparameter *maxn* 20)

(defclass node ()
  ((left :accessor left
         :initarg :left)
   (right :accessor right
          :initarg :right)
   (ori-position :accessor ori-position
                 :initarg :ori-position)))

(defparameter *s* (make-array *maxn*
                              :element-type 'node
                              :fill-pointer 0
                              :adjustable t))
(defparameter *fenwick* (make-array *maxn*
                                    :element-type 'integer
                                    :fill-pointer 0
                                    :adjustable t))
(defparameter *ans* (make-array *maxn*
                                    :element-type 'integer
                                    :fill-pointer 0
                                    :adjustable t))

(defun print-array ()
  (loop for i from 0 to (1- *n*) do
           (format t "i = ~d, ~d ~d~%"
                   i
                   (left (aref *s* i))
                   (right (aref *s* i)))))

(defun lowbit (x)
  (boole boole-and x (- x)))

(defun presum (index)
  (let ((ans 0))
    (do ((i index
            (- i (lowbit i))))
        ((<= i 0) ans)
      (incf ans (elt *fenwick* (1- i))))))

(defun update-fenwick (index)
  (do ((i index (+ i (lowbit i))))
      ((> i *n*))
    (incf (elt *fenwick* (1- i)))))

(with-open-file
    (*standard-input*
     "in.txt"
     :if-does-not-exist nil)
  (setq *n* (read))
  (loop for i from 0 to (1- *n*) do
    (vector-push-extend
     (make-instance 'node
                    :left (read)
                    :right (read)
                    :ori-position i)
     *s*)
    (vector-push-extend 0 *fenwick*)
    (vector-push-extend 0 *ans*)))

(sort *s* #'< :key #'right)

;; compress right
(loop for i from 0 to (1- *n*) do
  (setf (right (elt *s* i))
        (1+ i)))

;; sort by left reverse
(sort *s* #'> :key #'left)
(loop for i from 0 to (1- *n*) do
  (setf (elt *ans* (ori-position (elt *s* i)))
        (presum (right (elt *s* i))))
  (update-fenwick (right (elt *s* i))))

(defun print-ans ()
  (loop for i from 0 to (1- *n*) do
    (format t "~d~%" (elt *ans* i))))

(print-ans)

