(defparameter my-array (make-array 10
                                   :element-type 'integer
                                   :adjustable t
                                   :fill-pointer 0))

(loop for i from 1 to 10 do
  (vector-push-extend (random 30) my-array))

(setf (subseq my-array 1) (sort (subseq my-array 1) #'<))

(defparameter a (make-array '(4 3)))

(dotimes (i 4)
  (dotimes (j 3)
    (setf (aref a i j)
          (list i 'x
                j '= (* i j)))))

(defparameter b (make-array ))
