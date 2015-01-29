; 13.1 example

(setf my-vec '#(tuning violion 440 a))

(aref my-vec 1)

(setf a '#(nil nil nil nil nil))

(setf (aref a 0) 'foo)

(setf (aref a 1) 37)

(format t "~S ~S" (aref a 0)
	(aref a 1))

(setf b (make-array 5 :initial-element 1))

(setf alph (make-array 5 :initial-contents '(a e i o u)))

(format t "~&~S" (length "Cockatoo"))

(format t "~&~S" (reverse "abcde"))

(format t "~&~S" (aref "abcdefgh" 3))

(setf pet "Cockatoo")

(format t "~&p = ~S" pet)

(setf (aref pet 5) #\p)

(format t "~&p = ~S" pet)

(setf h (make-hash-table))

(setf (gethash 'john h)
      '(attorney (16 maple drive)))

(setf (gethash 'mary h)
      '(physician (23 cedar court)))

;  property list

(setf (get 'fred 'sex) 'male)
(setf (get 'fred 'age) 23)
(setf (get 'fred 'siblings) '(george wanda))
(incf (get 'fred 'age))
(format t "~&age is ~S" (get 'fred 'age))
(format t "~&property list of fred is ~S" (symbol-plist 'fred))
(remprop 'fred 'age)
(format t "~&age is ~S" (get 'fred 'age))

; 13.9 programming with property lists

(defun addprop (sym elem prop)
  (pushnew elem (get sym prop)))

(defun record-meeting (x y)
  (addprop x y 'has-met)
  (addprop y x 'has-met))
