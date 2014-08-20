(setf lst '(c a r a t))
(remove 'a lst)
(setf lst (remove 'a lst))

(defun show-squares (start end)
 (do ((i start (+ i 1)))
	((> i end) 'done)
	(format t "~A ~A~%" i (* i i))))

(defun show-squares-re (i end)
 (if (> i end)
	'done
	(progn
	(format t "~A ~A~%" i (* i i))
	(show-squares-re (+ i 1) end))))

(defun our-length (lst)
 (let ((len 0))
	(dolist (obj lst)
	 (setf len (+ len 1)))
	len))

(defun our-length-re (lst)
 (if (null lst)
	0
	(+ (our-length-re (cdr lst)) 1)))

(apply #'+ '(1 2 3))

(apply #'+ 1 2 '(3 4 5))

(defun ask-number ()
 (let ((val (read)))
	(if (numberp val)
	 (format t "The number you input is: ~A~%" val)
	 (ask-number))))
