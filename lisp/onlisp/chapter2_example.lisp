;;;====================
;;; some example code
;;; in chapter 2
;;; 2015/02/13
;;;====================

;;====================
;; 2.2 Define function

(defun double (x)
  (* x 2))

(double 1)

#'double
(eq #'double (car (list #'double)))

(lambda (x) (* x 2))

#'(lambda (x) (* x 2))

((lambda (x) (* x 2)) 3)

(setf double 2)
					; double can be the name of function and a symbol
(double double) ; return 4

(symbol-value 'double) ; get value of a symbol

(symbol-function 'double) ; get the function named symbol

(setq x #'append)
(eq (symbol-value 'x) (symbol-function 'append))

(defun double-1 (x)
  (* x 2))

;; equals to

(setf (symbol-function 'double)
      #'(lambda (x) (* x 2)))

;;====================
;; 2.3

(+ 1 2) ; equals to 
(apply #'+ '(1 2)) ; equals to
(apply (symbol-function '+) '(1 2)) ; equals to
(apply #'(lambda (x y) (+ x y)) '(1 2))

					; apply argument list: last element must be a list
					; however, funcall need not.
(funcall #'+ 1 2)

(mapcar #'(lambda (x)
	    (+ x 100))
	'(1 2 3))

(mapcar #'+
	'(1 2 3)
	'(10 100 1000))

