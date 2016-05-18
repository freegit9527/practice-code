(defun count-atoms (exp)
  (if (atom exp)
      1
      (+ (count-atoms (first exp))
         (if (rest exp)
             (count-atoms (rest exp))
             0))))

(print (count-atoms '(a nil)))
(print (count-atoms '(a (b) c)))
(print (count-atoms '(a () c)))
(print (count-atoms '(a nil c)))
