;;;; Chapter 6 Functions

;;; 6.1 Global Functions

(fboundp '+)

(symbol-function '+)

(defun add (&rest lst)
  (apply #'+ lst))

(defun choose-which (a b c)
  (let* ((input (read-line))
         (func (cond ((equal input "add") 'add)
                     ((equal input "sub") 'sub))))
    (if (fboundp func)
        (funcall func a b c))))

(setf (symbol-function 'add2)
      #'(lambda (x)
	  (+ x 2)))

;; equals to

(defun add2-1 (x)
  (+ x 2))

(defun primo (lst)
  (car lst))


<<<<<<< HEAD
(defun (setf primo1) (val lst)
  (setf (car lst) val))

=======
(defun (setf primo) (val lst)
  (setf (car lst)
	val))

(let ((x (list 'a 'b 'c)))
  (setf (primo x)
	480)
  x)

;;; 6.2 Local Functions

(labels ((add10 (x)
		(+ x 10))
	 (consa (x) (cons 'a x)))
  (consa (add10 3)))

(labels ((len (lst)
	      (if (null lst)
		  0
		(+ (len (cdr lst))
		   1))))
  (len '(a b c)))

;;; 6.3 Parameter Lists

(defun our-funcall (fn &rest args)
  (apply fn args))

(our-funcall '+ 1 2 3 4 5)

(defun philosoph (thing &optional (property 'fun))
  (list thing 'is property))

(philosoph 'death)

(philosoph 'death 'must)

(defun keylist (a &key x y z)
  (list a x y z))

(keylist 1 :y 2)

(keylist 1 :y 3 :x 2)

(defun our-adjoin (obj lst &rest args)
  (if (apply #'member obj lst args)
      lst
      (cons obj lst)))

(our-adjoin 'a '(a b c))

(our-adjoin 'd '(a b c))

