(defmacro increase-by-one (var)
  `(setf ,var (+ ,var 1))
  `(format t "var is: " (symbol-name :var)))

(defparameter foo 100)
(increase-by-one foo)

(format t "foo = ~d" foo)

(defun get-argument-name (var)
  (format t "argument name is: ~S~&" "sth.")
  ;; do other things.
  )

(defparameter foo-bar 101)
(get-argument-name foo-bar)
;; should print : argument name is: foo-bar 
