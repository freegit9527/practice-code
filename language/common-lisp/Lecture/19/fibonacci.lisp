(defun fib (n)
  (if (<= n 2)
      1
      (+ (fib (1- n))
         (fib (- n 2)))))
;; T(n) = T(n-1) + T(n-2) + O(1)

(fib 5)

(defparameter *fib-table* (make-hash-table))

(defun fib-memo (n)
  (multiple-value-bind (val found-p)
      (gethash n *fib-table*)
    (if found-p
        val
        (setf (gethash n *fib-table*)
              (if (<= n 2)
                  1
                  (+ (fib-memo (- n 1))
                     (fib-memo (- n 2))))))))

(time
 (let ((n 40))
   (format t "~&~d" (fib-memo n))))

(time
 (let ((n 40))
   (format t "~&~d" (fib n))))

(time
 (reduce #'+ (make-list 100000
                        :initial-element 1)))
