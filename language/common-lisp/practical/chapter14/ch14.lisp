(let ((in
       (open "/home/aries/Hack/language/common-lisp/practical/chapter14/name.txt")))
  (format t "~a~%" (read-line in))
  (close in))

(let ((in
       (open "/home/aries/Hack/language/common-lisp/practical/chapter14/name1.txt"
             :if-does-not-exist nil)))
  (when in
    (format t "~a~%" (read-line in))
    (close in)))

(let ((in
       (open "/home/aries/Hack/language/common-lisp/practical/chapter14/name.txt")))
  (when in (loop for line = (read-line in nil)
              while line do (format t "~a~%" line))
        (close in)))

(defparameter *s*
  (open "/home/aries/Hack/language/common-lisp/practical/chapter14/name1.lisp"))

(format t "~a~%" (read *s*))

(close *s*)

(vector 1 2 3)
