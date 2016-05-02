(defun primep (number)
  (when (> number 1)
    (loop for i from 2 to (isqrt number)
       never (zerop (mod number i)))))

(defun next-prime (number)
  (loop for i from number
     if (primep i) return i))



(do-primes (i 0 19)
  (format t "~d" i))

(do ((p (next-prime 0) (next-prime (1+ p))))
    ((> p 19))
  (format t "~S " p))
