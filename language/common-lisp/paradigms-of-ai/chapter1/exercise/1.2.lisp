(defun power (x n)
  (if (zerop n)
      1
      (* x (power x (1- n)))))
