(defun count-anywhere (exp lst)
  (if (null lst)
      0
      (+ (if (atom (first lst))
             (if (equal exp
                        (first lst))
                 1
                 0)
             (count-anywhere exp (first lst)))
         (count-anywhere exp (rest lst)))))

(print (count-anywhere 'a
                       '(a ((a) b) a)))
