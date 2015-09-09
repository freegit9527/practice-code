(defmacro my-when (condition &rest body)
  `(if ,condition (progn ,@body)))

(my-when (> 3 2)
	 (format t "It is true.~%")
	 (format t "Goodbye ;)"))

(defun fibonacci (num)
  (do ((n 0 (1+ n))
       (cur 0 next)
       (next 1 (+ cur next)))
      ((= n num) nil)
    (format t "~d~%" cur)))


