(defun primep (number)
  (when (> number 1)
    (loop for i from 2 to (isqrt number)
       never (zerop (mod number i)))))

(defun next-prime (number)
  (loop for i from number
     if (primep i) return i))

(macroexpand-1 '(do-primes (i 0 19)
                 (format t "~d " i)))

(do
 ((i
   (next-prime 0)
   (next-prime (1+ i))))
 ((> i 19))
  (format t "~d " i))

(do-primes (i 0 19)
  (format t "~d " i))

(do ((p (next-prime 0) (next-prime (1+ p))))
    ((> p 19))
  (format t "~S " p))

(defmacro do-primes (parameters &body body)
  (let ((var (first parameters))
        (start (second parameters))
        (end (third parameters)))
    `(do ((,var (next-prime ,start)
                (next-prime (1+ ,var))))
         ((> ,var ,end))
       ,@body)))

(defmacro do-primes-1 ((var start end) &body body)
  `(do ((,var (next-prime ,start)
              (next-prime (1+ ,var))))
       ((> ,var ,end))
     ,@body))

(do-primes-1 (i 0 100)
  (format t "~d " i))

(do
 ((i
   (next-prime 0)
   (next-prime (1+ i))))
 ((> i 100))
  (format t "~d " i))

(do-primes-1 (i 0 (random 100))
  (format t "~d " i))

(do ((i (next-prime 0) (next-prime (1+ i))))
    ((> i (random 100)))
  (format t "~d " i))
;; it is not correct ;(

(defmacro do-primes-2 ((var start end)
                       &body body)
  `(do ((,var (next-prime ,start)
              (next-prime (1+ ,var)))
        (ending-value ,end))
       ((> ,var ending-value))
     ,@body))

(do-primes-2 (i 0 (random 100))
  (format t "~d " i))

(do ((i (next-prime 0) (next-prime (1+ i)))
     (ending-value (random 100)))
    ((> i ending-value))
  (format t "~d " i))
;; now it's correct ;)

(do-primes-2 (ending-value 0 (random 100))
  (print ending-value))
(do ((ending-value (next-prime 0) (next-prime (1+ ending-value)))
     (ending-value (random 100)))
    ((> ending-value ending-value))
  (print ending-value))

;; it's not correct either... ;(
(let ((ending-value 0))
  (do-primes-2 (i 0 100)
    (incf ending-value i)
    ;; sum the primes.
    )
  ending-value)
(let ((ending-value 0))
  (do ((i (next-prime 0) (next-prime (1+ i)))
       (ending-value 100))
      ((> i ending-value))
    (incf ending-value i))
  ending-value)

(defmacro do-primes-3 ((var start end) &body body)
  (let ((ending-value (gensym)))
    `(do ((,var (next-prime ,start)
                (next-prime (1+ ,var)))
          (,ending-value ,end))
         ((> ,var ,ending-value))
       ,@body)))

(do-primes-3 (i 0 100)
  (format t "~d " i))

(do ((i (next-prime 0) (next-prime (1+ i)))
     (#:g906 100))
    ((> i #:g906))
  (format t "~d " i))

(do-primes-3 (ending-value 0 (random 100))
  (format t "~d " ending-value))
(do ((ending-value (next-prime 0) (next-prime (1+ ending-value)))
     (#:g917 (random 100)))
    ((> ending-value #:g917))
  (print ending-value))

(let ((ending-value 0))
  (do-primes-3 (i 0 100)
    (incf ending-value i)
    ;; sum the primes.
    )
  ending-value)

(let ((ending-value 0))
  (do ((i (next-prime 0) (next-prime (1+ i)))
       (#:g951 100))
      ((> i #:g951))
    (incf ending-value i))
  ending-value)

(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for i in names collect `(,i (gensym)))
     ,@body))

(with-gensyms (a b c d)
  (format t "~S" a))

(let ((a (gensym)) (b (gensym)) (c (gensym)) (d (gensym)))
  (format t "~s" a))

(defmacro do-primes-4 ((var start end)
                       &body body)
  (with-gensyms (ending-value)
    `(do ((,var (next-prime ,start)
                (next-prime (1+ ,var)))
          (,ending-value ,end))
         ((> ,var ,ending-value))
       ,@body)))

(do-primes-4 (ending-value 0 (random 100))
  (format t "~d " ending-value))

(do ((ending-value (next-prime 0) (next-prime (1+ ending-value)))
     (#:g952 (random 100)))
    ((> ending-value #:g952))
  (format t "~d " ending-value))


