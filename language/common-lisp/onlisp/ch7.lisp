(defmacro nil! (var)
  `(setf ,var nil))

(defparameter hello 100)

(nil! hello)

(defmacro nif (var zero positive negative)
  `(case (truncate (signum ,var))
     (0 ,zero)
     (1 ,positive)
     (-1 ,negative)))

(setf hello 99)

(nif hello 'z 'p 'n)

(macroexpand-1 '(nif hello 'z 'p 'n))
(case (signum hello)
  (0 'z)
  (1 'p)
  (-1 'n))

(mapcar #'(lambda (x)
            (nif x 'z 'p 'n))
        '(100 -10 0 10))
;; (P N Z P)

(defmacro mac (expression)
  `(pprint (macroexpand-1 ',expression)))

(mac (nif hello 'z 'p 'n))

(case (signum hello)
  (0 'z)
  (1 'p)
  (-1 'n))

