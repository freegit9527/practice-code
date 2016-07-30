;; 1. use EQ to compare symbols
;; 2. use EQUAL for everything else

;; using EQ
(defparameter *fruit* 'apple)

(princ
 (cond ((eq *fruit* 'apple)
        'its-an-apple)
       ((eq *fruit* 'orange)
        'its-an-orange)))

;; ====================

;; using EQUAL

;; comparing symbols
(equal 'apple 'apple)
;; T

;; comparing lists
(equal (list 1 2 3)
       (list 1 2 3))
;; T

;; comparing lists created in different ways
(equal '(1 2 3)
       (cons 1 (cons 2 (cons 3 nil))))
;; T

(equal '(1 2 3 (4 5 (6)))
       '(1 2 3 (4 5 (6))))
;; T

;; comparing integers
(equal 5 5)
;; T

;; comparing floating point numbers
(equal 2.5 2.5)
;; T

;; comparing strings
(equal "foo" "foo")
;; T
(equal "foo" "Foo")
;; Nil

;; comparing characters
(equal #\a #\a)
;; T

;; ====================

;; EQL is similar to the EQ command, but unlike EQ, it also
;; handles comparisons of numbers and characters:

;; comparing symbols
(eql 'foo 'foo)
;; T

(eql 'foo 'Foo)
;; T

;; comparing numbers
(eql 3.4 3.4)
;; T

;; comparing characters
(eql #\a #\a)
;; T

;; ====================

;; EQUALP command is essentially the same as the EQUAL command,
;; except that it can compare strings with different
;; capitalizations and can compare integers against
;; floating-point numbers:

;; comparing strings with different CAPS
(equalp "Bob Smith" "bob smith")
;; T

;; comparing integers against floating point numbers
(equalp 0 0.00)
;; T
(equalp 1 1.000)
;; T

;; ====================

;; = handle numbers
;; STRING-EQUAL handle strings
;; CHAR-EQUAL handle characters
