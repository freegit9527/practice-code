(defparameter *my-array*
  (make-array 10 :element-type 'integer))

(loop for i from 0 to 9 do
  (setf (aref *my-array* i) i))
