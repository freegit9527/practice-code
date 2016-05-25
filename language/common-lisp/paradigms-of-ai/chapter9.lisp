(defun fib (n)
  (if (<= n 1)
      1
      (+ (fib (- n 1))
         (fib (- n 2)))))

(defun fib1 (n)
  (if (<= n 1)
      1
      (+ (fib1 (- n 1))
         (fib1 (- n 2)))))

(defun memo (fn)
  "Return a memo-function of fn."
  (let ((table (make-hash-table)))
    #'(lambda (x)
        (multiple-value-bind (val found-p)
            (gethash x table)
          (if found-p
              val
              (setf (gethash x table)
                    (funcall fn x)))))))

(defparameter memo-fib (memo #'fib))

(funcall memo-fib 3)

(defun memorize (fn-name)
  "Replace fn-name's global definition with memorized versiion."
  (setf (symbol-function fn-name)
        (memo (symbol-function fn-name))))

(memorize 'fib)

(fib 5)

(fib 40)
;; (fib1 34)

(defmacro defun-memo (fn args &body body)
  "Define a memorized functin."
  `(memorize
    (defun ,fn ,args ,@body)))

(defun-memo f(x)
    (1+ x))
(memorize (defun f (x) (1+ x)))


(defun clear-memoize (fn-name)
  "Clear the hash table from a memo function."
  (let ((table (get fn-name 'memo)))
    (when table
      (clrhash table))))

(defun memoize (fn-name &key (key #'first)
                          (test #'eql))
  "Replace fn-name's global definition with a
memoized version."
  (memo (symbol-function fn-name)
        fn-name key test))

(defun memo (fn name key test)
  "Return a memo-function of fn."
  (let ((table (make-hash-table :test test)))
    (setf (get name 'memo) table)
    #'(lambda (&rest args)
        (let ((k (funcall key args)))
          (multiple-value-bind (val found-p)
              (gethash k table)
            (if found-p
                val
                (setf (gethash k table)
                      (apply fn args))))))))
