;;; ##############################
;;;                              #
;;;     chapter 13 Arrays,       #
;;;      Hash Tables, And        #
;;;       Property Lists         #
;;;        Example code          #
;;;         2015/01/10           #
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

(inspect h)

;; 13.8 PROPERTY LISTS

(setf (get 'fred 'sex) 'male)

(setf (get 'fred 'age) 23)

(setf (get 'fred 'siblings) '(george wanda))

(describe 'fred)

(get 'fred 'age)
(get 'fred 'favorite-ice-cream-flavor)

; third argument
(setf (get 'mabel 'siblings) nil)

(get 'mabel 'siblings 'unknown)

(get 'clara 'siblings 'unknown)

; change a property
(get 'fred 'age)
(incf (get 'fred 'age))
(get 'fred 'age)

; symbol's property list
(symbol-plist 'fred)

; remove a property
(remprop 'fred 'age)
(get 'fred 'age)

;; 13.9 PROGRAMMING WITH PROPERTY LISTS

(defun addprop (sym elem prop)
  (pushnew elem (get sym prop)))

(defun record-meeting (x y)
  (addprop x y 'has-met)
  (addprop y x 'has-met)
  t)

(symbol-plist 'little-red)
(record-meeting 'little-red 'wolfie)
(symbol-plist 'little-red)
(symbol-plist 'wolfie)
(record-meeting 'wolfie 'grandma)
(symbol-plist 'wolfie)
