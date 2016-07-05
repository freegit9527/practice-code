;; (setf *read-default-float-format*
;;       'double-float)
(format t "~,10f~%" (coerce (1+ (/ (* 2 (sqrt 3.0))
                                   (- 5 0.1)))
                            'double-float))
(format t "~,10f~%" (1+ (/ (* 2 (sqrt 3.0))
                           (- 5 0.1))))
(format t "~,10f~%" (1+ (/ (* 2 (sqrt 3.0d0))
                           (- 5 0.1d0))))
