(defclass node ()
  ((left :accessor left
         :initarg :left)
   (right :accessor right
          :initarg :right)
   (ori-position :accessor ori-position
                 :initarg :ori-position)))

(defparameter *s* (make-array 10
                              :element-type 'node))

(loop for i from 0 to 9 do
  (setf (aref *s* i)
        (make-instance 'node
                       :left 0
                       :right 0
                       :ori-position 0)))

(defun print-array ()
  (loop for i from 0 to 9 do
    (format t "i = ~d, left = ~d,right = ~d~%"
            i
            (left (aref *s* i))
            (right (aref *s* i)))))

(print-array)

(loop for i from 0 to 9 do
  (if (evenp i)
      (setf (left (aref *s* i))
            233)))

(format t "-------------~%")

(print-array)
