(defun count-atoms (exp)
  (if (atom exp)
      1
      (+ (first exp)
         (rest exp))))
