;;; ANSI Common LISP

;;; Chapter 4 Specialized Data Structures

;; 4.1 Arrays

(setf arr (make-array '(2 3)
		      :initial-element nil))

(aref arr 0 0)

(setf (aref arr 0 0) 'b)

(aref arr 0 0)

(setf arr1 #2a ((a nil nil) (b nil nil)))

(setf *print-array* t)

(setf vec (make-array 4
		      :initial-element nil))

(setf vec1 (vector "a" 'b 3))

(svref vec1 1)

;; 4.2 Example: Binary Search

(defun finder (obj vec start end)
  (let ((range (- end start)))
    (if (zerop range)
	(if (equal obj (aref vec start))
	    obj
	  nil)
      (let ((mid (+ start
		    (round (/ range 2)))))
	(let ((obj2 (aref vec mid)))
	  (if (< obj obj2)
	      (finder obj vec start (- mid 1))
	    (if (> obj obj2)
		(finder obj vec (+ mid 1) end)
	      obj)))))))


(defun bin-search (obj vec)
  (let ((len (length vec)))
    (and (not (zerop len))
	 (finder obj vec 0 (1- len)))))


