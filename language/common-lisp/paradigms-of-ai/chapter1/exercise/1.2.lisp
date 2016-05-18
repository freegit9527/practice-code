(defun power (x n)
  (if (zerop n)
      1
      (* x (power x (1- n)))))

(defun power-answer (x n)
  "Power raises x to the nth power. N
must be an integer >= 0.
This executes in log n time, because
of the check for even n."
  (cond ((= n 0)
         1)
        ((evenp n)
         (expt (power-answer x (/ n 2))
               2))
        (t
         (* x (power-answer x (1- n))))))
