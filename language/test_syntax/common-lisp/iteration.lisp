(loop
  (print "Here I am.")
  (return 17)
  ;; (print "I never got here.")
  )

(let ((n 0))
  (loop
    (when (> n 10)
      (return))
    (print n) (prin1 (* n n))
    (incf n)))

(dotimes (i 11)
  (print i) (prin1 (* i i)))

;; use C-c C-d h to look up the documentation of a function.

(dolist (item '(1 2 4 5 9 17 25))
  (format t "~&~d is~:[n't~;~] a perfect square.~%"
          item (equalp (sqrt item)
                       (isqrt item))))

(dolist (item `(1 foo "Hello"
                  79.3 2/3 ,#'abs))
  (format t "~&~s is a ~a~%" item
          (type-of item)))

(defparameter temp-two nil)
(dolist (temp-one '(1 2 3 4)
                  temp-two)
  (push temp-one temp-two))

(format t "~{~a ~}~%" temp-two)
(format t "~a~%" temp-two)

(do ((which 1 (1+ which))
     (list '(foo bar baz qux) (rest list)))
    ((null list) 'done)
  (format t "~&Item ~d is ~s.~%" which
          (first list)))
