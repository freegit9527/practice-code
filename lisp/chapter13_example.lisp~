;;; ##############################
;;;                              #
;;;     chapter 13 Arrays,       #
;;;      Hash Tables, And        #
;;;       Property Lists         #
;;;                              #
;;; ##############################



;; ==============================
;; ==============================

;; 13.2 CREATING AN ARRAY

(setf my-vec '#(tuning violin 440 a))

;; 13.3 PRINTING ARRAYS

(setf *print-array* nil)
(format t "~&~S" my-vec)
my-vec

(setf *print-array* t)
(format t "~&~S" my-vec)
my-vec

;; 13.4 ACCESSING AND MODIFYING ARRAY ELEMENTS

(aref my-vec 1)

(setf a '#(nil nil nil nil nil))

(setf (aref a 0) 'foo)
(setf (aref a 1) 37)
(setf (aref a 2) 'bar)
(format t "~&~S" a)

(length a)
(reverse a)
(find-if #'numberp a)

;; 13.5 CREATING ARRAYS WITH MAKE-ARRAY

(make-array 5 :initial-element 1)

(make-array 5 :initial-contents '(a e i o u))

;; 13.6 STRINGS AS VECTORS

(length "Cockatoo")

(reverse "Cockatoo")

(aref "Cockatoo" 3)

(type-of #\k)

(setf pet "Cockatoo")
(setf (aref pet 5) #\p)

;; 13.7 HASH TABLES

(setf h (make-hash-table))

(type-of h)

(setf (gethash 'john h)
      '(attorney (16 maple drive)))

(format t "~&~S" (gethash 'john h))

(setf (gethash 'mary h)
      '(physician (23 cedar court)))

(format t "~&~S" (gethash 'mary h))

(gethash 'bill h)

(format t "~&~S" h)

(gethash 'mary h) ; return two value. 1. value of key 2. T or NIL

(describe h)