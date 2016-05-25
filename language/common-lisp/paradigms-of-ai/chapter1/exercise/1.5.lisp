(defun dot-product (exp1 exp2)
  (apply #'+ (mapcar #'* exp1 exp2)))

(print (dot-product '(10 20)
                    '(3 4)))
