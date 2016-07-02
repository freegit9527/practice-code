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

(defparameter b (make-array 8 :displaced-to a
                              :displaced-index-offset 2))

(dotimes (i 8)
  (format t "i = ~d " i)
  (format t "~s ~%" (aref b i)))

(let ((array #(10 9 8 7 6 5)))
  (sort (make-array 5 :displaced-to array
                      :displaced-index-offset 1
                      :fill-pointer 5)
        #'<)
  (print array))
