;;;====================
;;; some example code
;;; in chapter 3
;;; Functional Programming
;;; 2015/02/27
;;;====================

;;; ====================
;;; 3.1 Function Design

(defun good-reverse (lst)
  (labels ((rec (lst acc)
		(if (null lst)
		    acc
		  (rec (rest lst)
		       (cons (first lst) acc)))))
    (rec lst nil)))

(= 2 (truncate 2.6)) ; return t. It uses first return value

(format t "~&~S"
	(multiple-value-bind (int frac)
	    (truncate 2.66)
	  (list int frac)))

(defun powers (x)
  (values x (sqrt x) (expt x 2)))

(format t "~&~S"
	(multiple-value-bind (base root square)
	    (powers 4)
	  (list base root square)))

;; ====================
;; 3.2 Imperative Outside-In

(defun fun (x)
  (list 'a (expt (car x) 2)))

(defun imp (x)
  (let (y sqr)
    (setq y (car x))
    (setq sqr (expt y 2))
    (list 'a sqr)))

;; ====================
;; 3.3 Functional Interfaces

(defun exclaim (expression)
  (append expression '(oh my)))

; type following three expressions in REPL

;(exclaim '(lions and tigers and bears))

;(nconc * '(goodness))

;(exclaim '(fixnums and bignums and floats))

; so we should write:

(defun exclaim (expression)
  (append expression (list 'oh 'my)))

