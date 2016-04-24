(let ((x 1) (y 2))
 (+ x y))

(defun ask-number ()
 (format t "Please enter a number.")
 (let ((val (read)))
	(if (numberp val)
	 val
	 (ask-number))))

(defparameter *glob* 99)

(defconstant limit (+ *glob* 1))

(setf *glob* 98) 

(let ((n 10))
 (setf n 2)
 n)

(setf x (list 'a 'b 'c))

(setf (car x) 'n)

(setf a 'b 
 			c 'd
			e 'f)

(setf lst '(c a r a t))

(remove 'a lst)

(setf x (remove 'a x))

(defun show-squares (start end)
 (do ((i start (+ i 1)))
	((> i end) 'done)
	(format t "~A ~A ~%" i (* i i))))

(defun show-squares-1 (i end)
 (if (> i end)
	'done
	(progn
	 (format t "~A ~A ~%" i (* i i))
	 (show-squares-1 (+ i 1) end))))

(defun our-length (lst)
 (let ((len 0))
	(dolist (obj lst)
	 (setf len (+ len 1)))
	len))

(defun our-length-1 (lst)
 (if (null lst)
	0
	(+ 1 (our-length-1 (cdr lst)))))

(defun our-listp (x)
 (or (null x) (consp x)))

(defun our-atom (x)
 (not (consp x)))

(setf x '(a b c)
 			y (copy-list x))

(defun n-elt (n elt)
 (if (> n 1)
	(list n elt)
	elt))

(defun compr (current num rst)
 (if (null rst)
	(list (n-elt num current))
 (if (eql current (car rst))
	(compr current (+ 1 num) (cdr rst))
	(cons (n-elt num current) (compr (car rst) 1 (cdr rst))))))

(defun his-compr (elt n lst)
 (if (null lst)
	(list (n-elts elt n))
	(let ((next (car lst)))
	 (if (eql next elt)
		(his-compr elt (+ 1 n) (cdr lst))
		(cons (n-elts elt n)
		 (his-compr next 1 (cdr lst)))))))

(defun compress (lst)
 (if (null lst)
	nil
	(compr (car lst) 1 (cdr lst))))

(defun his-compress (x)
 (if (consp x)
	(his-compr (car x) 1 (cdr x))
	x))


(defun n-elts (elt n)
 (if (> n 1)
	(list n elt)
	elt))

(setf lst '(1 1 1 0 1 0 0 0 0 1 2 2 3))

(defun list-of (num cur)
 (if (zerop num)
	nil
	(cons cur (list-of (- num 1) cur))))

(defun uncompress (lst)
 (if (null lst)
	nil
	(let ((current (car lst)))
	 (if (listp current)
		(append (list-of (car current) (second current))
		 (uncompress (cdr lst)))
		(cons current (uncompress (cdr lst)))))))

(defun his-uncompress (lst)
 (if (null lst)
	nil
	(let ((elt (car lst))
				(rest (his-uncompress (cdr lst))))
	 (if (consp elt)
		(append (apply #'list-of elt) rest)
		(cons elt rest)))))

(setf lst-c '((3 1) 0 1 (4 0) 1 (2 2) 3))

