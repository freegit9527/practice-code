;;;; Chapter 5 Control

;;; 5.1 Blocks

(block head
  (format t "Here we go.")
  (return-from head 'idea)
  (format t "We'll never see this."))

(defun foo ()
  (return-from foo 27))

(defun read-integer-1 (str)
  (let ((accum 0))
    (dotimes (pos (length str))
      (let ((i (digit-char-p (char str pos))))
	(if i
	    (setf accum (+ (* accum 10) i))
	  (return-from read-integer nil))))
    accum))

(tagbody
 (setf x 0)
 top
 (setf x (1+ x))
 (format t "~A " x)
 (if (< x 10)
     (go top)))

;;; 5.2 Context

(setf x 102)

(let ((x 2)
      (y (1+ x)))
  (+ x y))

;; equals to:

((lambda (x y)
   (+ x y))
 2
 (1+ x)) ; x refers to global x

(let* ((x 1)
       (y (1+ x)))
  (+ x y))

;; equals to:

(let ((x 1))
  (let ((y (1+ x)))
    (+ x y)))

;; let* is functionally equivalent to a series
;; of nested lets.

(let (x y)
  (list x y)) ; return (nil nil)

(destructuring-bind (w (x y) . z)
    '(a (b c) d e)
  (list w x y z))

;;; 5.3 Conditionals

(when (oddp x)
  (format t "Hmm, that's odd.")
  (1+ x))

;; equals to:

(if (oddp x)
    (progn
      (format t "Hmm, that's odd.")
      (1+ x)))

(defun our-member (obj lst)
  (if (atom lst)
      nil
    (if (eql (car lst) obj)
	lst
      (our-member obj (cdr lst)))))

;; equals to:

(defun our-member-1 (obj lst)
  (cond ((atom lst) nil)
	((eql obj (car lst)) lst)
	(t (our-member-1 obj (cdr lst)))))

(defun month-length (mon)
  (case mon
    ((jan mar may jul aug oct dec) 31)
    ((apr jun sept nov) 30)
    (feb (if (leap-year) 29 28))
    (otherwise "unknown month")))

;;; 5.4 Iteration

(defun show-squares (start end)
  (do ((i start (1+ i)))
      ((> i end) 'done)
    (format t "~A ~A~%" i (* i i))))

(let ((x 'a))
  (do ((x 1 (1+ x))
       (y x x))
      ((> x 5))
    (format t "(~A ~A)  " x y)))

;; compares to:

(do* ((x 1 (1+ x))
      (y x x))
    ((> x 5))
  (format t "(~A ~A) " x y))

(dolist (x '(a b c d) 'done) ; third expression will be return value
  (format t "~A " x)) 

(dotimes (x 5 x) ; third expression will be return value
  (format t "~A " x))

(mapc #'(lambda (x y) ; It always returns its second argument.
	  (format t "~A ~A " x y))
      '(hip flip slip)
      '(hop flop slop))

;;; 5.5 Multiple Values

(values 'a nil (+ 2 4))

((lambda ()
   ((lambda ()
      (values 1 2)))))

(let ((x (values 1 2))) ; x is 1
  x)

(values) ;return nil

(let ((x (values)))
  x) ; return nil

(multiple-value-bind (x y z)
    (values 1 2 3)
  (list x y z))

(multiple-value-bind (x y z)
    (values 1 2)
  (list x y z))

(multiple-value-bind (s m h) (get-decoded-time)
  (format t "~A:~A:~A" h m s))

(multiple-value-call #'+ (values 1 2 3))

(multiple-value-list (values 'a 'b 'c))

;;; 5.6 Aborts

;; Sorry, I can not understand this part

;;; 5.7 Example: Date Arithmetic

(setf mon '(31 28 31 30 31 30
	       31 31 30 31
	       30 31))

(apply #'+ mon)

(setf nom (reverse mon))

(setf sums (maplist #'(lambda (x)
			(apply #'+ x))
		    nom))

(reverse sums)

(defconstant month
  #(0 31 59 90 120 151 181 212
      243 273 304 334 365))

(defconstant yzero 2000)

(defun leap? (y)
  (and (zerop (mod y 4))
       (or (zerop (mod y 400))
	   (not (zerop (mod y 100))))))

(defun date-num (d m y)
  (+ (1- d)
     (month-num m y)
     (year-num y)))

(defun month-num (m y)
  (+ (svref month (1- m))
     (if (and (> m 2)
	      (leap? y))
	 1
       0)))

(defun year-num (y)
  (let ((d 0))
    (if (>= y yzero)
	(dotimes (i (1 y yzero) d)
	  (incf d (year-days (+ yzero i))))
      (dotimes (i (- yzero y) (- d))
	(incf d (year-days (+ y i)))))))

(defun year-days (y)
  (if (leap? y)
      366
    365))

(defun num-date (n)
  (multiple-value-bind (y left)
      (num-year n)
    (multiple-value-bind (m d)
	(num-month left y)
      (values d m y))))

(defun num-year (n)
  (if (< n 0)
      (do* ((y (1- yzero) (1- y))
	    (d (- (year-days y))
	       (- d (year-days y))))
	  ((<= d n) (values y (- n d))))
    (do* ((y yzero (1+ y))
	  (prev 0 d)
	  (d (year-days y) (+ d (year-days y))))
	((> d n) (values y (- n prev))))))


