(let ((table (make-hash-table)))
  (defun fib (n)
    (or (progn
          (if
           (gethash n table)
           (format t "~d "
                   (gethash n table)))
          (gethash n table))
        (setf (gethash n table)
              (if (<= 0 n 1)
                  n
                  (+ (fib (1- n))
                     (fib (- n 2))))))))

(fib 20)

(defmemo fib (n)
  (if (<= 0 n 1)
      n
      (+ (fib (1- n))
         (fib (- n 2)))))

(fib 20)

(defun memo (f)
  (let ((cache (make-hash-table :test #'equalp)))
    (lambda (&rest args)
      (or (gethash args cache)
          (setf (gethash args cache)
                (apply f args))))))

(defmacro defmemo (name args &body body)
  `(setf (symbol-function ',name)
         (memo (lambda ,args ,@body))))

(setf (symbol-function 'square)
      (lambda (x)
        (* x x)))

(square 5)

(defmacro or= (place &rest args)
  (multiple-value-bind
        ))
