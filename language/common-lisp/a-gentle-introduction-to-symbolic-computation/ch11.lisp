					; 11.2 examples
(format t "~%")
(dotimes (i 4)
  (format t "~&I is ~S." i))

(dolist (x '(red blue green) 'flowers)
  (format t "~&Roses are ~S." x))

; 11.3 examples
(defun find-first-odd (lst)
  (dolist (e lst)
    (format t "~&Testing ~S..." e)
    (when (oddp e)
      (format t " found an odd number.")
      (return e))))

(defun a (lx)
  (1+ x))

(defun check-all-odd (list-of-numbers)
  (dolist (e list-of-numbers t)
    (format t "~&Checking ~S..." e)
    (if (not (oddp e))
	(return nil))))
  

(defun check-all-odd (list-of-numbers)
  (dolist (e list-of-numbers t)
    (format t "~&Checking ~S..." e)
    (if (not (oddp e)) (return nil))))

; 11.4
(defun it-fact (n)
  (let ((prod 1))
    (dotimes (i n prod)
      (setf prod (* prod (1+ i))))))

(defun it-intersection (x y)
  (let ((result-set nil))
    (dolist (ele x result-set)
      (when (member ele y)
	(push ele result-set)))))

; 11.7 example

(defun launch (n)
  (do ((cnt n (1- cnt)))
      ((zerop cnt) (format t "Blast off!"))
    (format t "~S..." cnt)))

; 11.8 example

(defun fact (n)
  (do ((i n (1- i))
       (result 1 (* result i)))
      ((zerop i) result)))

(defun do-intersection (x y)
  (do ((x1 x (rest x1))
       (result nil (if (member (first x1) y)
		       (cons (first x1) result)
		       result)))
      ((null x1) result)))

(defun do1-intersection (x y)
  (do ((x1 x (rest x1))
       (result nil))
      ((null x1) result)
    (when (member (first x1) y)
      (push (first x1) result))))

(defun find-matching-element (x y)
  (do ((x1 x (rest x1))
       (y1 y (rest y1)))
      ((or (null x1) (null y1)) nil)
    (when (equal (first x1) (first y1)) (return (first x1)))))


; 11.11 exercise
(defun find-largest (lst)
  (do* ((x lst (rest x))
	(large (first x)))
       ((null x) large)
    (when (> (first x) large)
      (setf large (first x)))))

; 11.11 example

(defun square-list (lst)
  (mapcar #'(lambda (x)
	      (if (numberp x)
		  (* x x)
		  (return-from square-list 'nope)))
	  lst))

(defun addup (n)
  (do ((i n (1- i))
       (result 0 (+ i result)))
      ((zerop i) result)))

; 11.13 example

(defun foo (x &optional y)
  (format t "~&X is ~S" x)
  (format t "~&Y is ~S" y)
  (list x y))

(defun divide-check (dividend &optional (divisor 2))
  (format t "~&~S ~A divide evenly by ~S"
	  dividend
	  (if (zerop (rem dividend divisor))
	      "does"
	      "does not")
	  divisor))

; 11.14 example

(defun average (&rest args)
  (/ (reduce #'+ args)
     (if (zerop (length args))
	 1.0
	 (length args))
     1.0))

(defun square-all (&rest args)
  (if (null args) nil
      (cons (* (first args) (first args))
	    (apply #'square-all (cdr args)))))

(defun make-sundae (name &key (size 'regular)
			   (ice-cream 'vanilla)
			   (syrup 'hot-fudge)
			   nuts
			   cherries
			   whipped-cream)
  (list 'sundae
	(list 'for name)
	(list ice-cream 'with syrup 'syrup)
	(list 'toppings '=
	      (remove nil
		      (list (and nuts 'nuts)
			    (and cherries 'cherries)
			    (and whipped-cream
				 'whipped-cream))))))


			    
		      
			    
