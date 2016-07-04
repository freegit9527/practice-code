(defparameter *s*
  (make-array 0
              :element-type 'character
              :adjustable t
              :fill-pointer 0))

(format *s* "Hello~%")
(format *s* "Goodbye")

(setf (fill-pointer *s*) 0)

(format *s* "A new beginning")

(loop for i upto 20 do
  (format t "~d~3T~d~%" i (1+ i)))

(print (loop for i upto 10 collect i))
(print (loop for i to 10 collect i))

(format t "~&Name~7TExtension~{~&~A~7T~A~}"
        '("Joe" 3215
          "Mary" 3246
          "Fred" 3222
          "Dave" 3232
          "Joseph" 3212))

(format t "~%~[Lisp 1.5~;MACLISP~;PSL~;Common Lisp~]~%" 3)

(format t "My computer ~:[doesn't~;does~] like lisp.~%" t)
(format t "My computer ~:[doesn't~;does~] like lisp.~%" nil)

(format t "~{~@[~a ~]~}~%" '(1 2 nil 3 t nil 4 nil))

(format t "~{~&~vd~}" '(5 37
                        10 253
                        15 9847
                        10 559
                        5 12))
