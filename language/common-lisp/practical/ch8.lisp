(defun primep (number)
  (loop for i from 2 to (isqrt number)
     never (zerop (mod number i))))

(defun next-prime (number)
  (loop for i from number
     if (primep i) return i))
