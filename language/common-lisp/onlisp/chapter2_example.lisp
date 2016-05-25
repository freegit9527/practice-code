;;;====================
;;; some example code
;;; in chapter 2
;;; 2015/02/13
;;;====================

(proclaim '(optimize speed))

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

;; 2015/02/26

(sort '(5 4 3 2 1) #'<)
(sort '(1 2 3 4 5) #'>)

(remove-if #'evenp '(1 2 3 4 5))

(defun our-remove-if (fn lst)
  (cond ((null lst) nil)
	((funcall fn (first lst))
	 (our-remove-if fn (rest lst)))
	(t (cons (first lst) (our-remove-if fn (rest lst))))))

(our-remove-if #'evenp '(1 2 3 4 5))

;;====================
;; 2.4 Functions as Properties

(defun behave (animal)
  (case animal
    (dog (wag-tail)
	 (bark))
    (rat (scurry)
	 (squeak))
    (cat (rub-legs)
	 (scratch-carpet))))

(defun behave-better (animal)
  (funcall (get animal 'behavior)))

(setf (get 'dog 'behavior)
      #'(lambda ()
	  (wag-tail)
	  (bark)))


;;====================
;;2.5 Scope

(let ((y 7))
  (defun scope-test (x)
    (list x y)))

;;====================
;;2.6 Closures

(defun list+ (lst n)
  (mapcar #'(lambda (x)
	      (+ x n))
	  lst))

(list+ '(1 2 3) 10)

(let ((counter 0))
  (defun new-id ()
    (incf counter))
  (defun reset-id ()
    (setq counter 0)))

(defun make-adder (n)
  #'(lambda (x)
      (+ x n)))

(setq add2 (make-adder 2)
      add10 (make-adder 10))

(mapcar add2 '(1 2 3))

;; ******************************

; It's time to think the key of when we must
; use #' and when not. As we will see:

(defun my-add (x y)
  (+ x y))

; equals to:

(setf (symbol-function 'my-add-1)
      #'(lambda (x y)
	  (+ x y)))

; Then we can use it like this:

(my-add 1 3)
(my-add-1 2 4)

; You can note that we use symbol-function here
; cause common lisp has distinct namespaces for
; variables and functions. If we write:

(setf my-add-2
      #'(lambda (x y)
	  (+ x y)))

; then my-add-2 is a symbol not a function.
; If we want to call it as a function, we can:

(funcall my-add-2 2 3)

; Besides, if we want to the content of my-add
; and my-add-1:

(symbol-function 'my-add)
(symbol-function 'my-add-1)

; In fact those output of above is the same as
; my-add-2

;; ******************************

(defun make-adderb (n)
  #'(lambda (x &optional change)
      (if change
	  (setq n x)
	(+ x n))))

(setq addx (make-adderb 1))

(defun make-dbms (db)
  (list
   #'(lambda (key)
       (cdr (assoc key db)))
   #'(lambda (key val)
       (push (cons key val)
	     db)
       key)
   #'(lambda (key)
       (setf db (delete key db :key #'car))
       key)))

(setq cities (make-dbms '((boston . us)
			  (paris . france))))

(funcall (car cities) 'boston )
(funcall (second cities) 'london 'england)
(funcall (car cities) 'london)

(defun lookup (key db)
  (funcall (car db) key))


;;====================
;; 2.7 Local Functions

(mapcar #'(lambda (x)
	    (+ 2 x))
	'(2 5 7 3))

(labels ((inc (x)
	      (1+ x)))
  (inc 3))

(defun count-instances (obj lsts)
  (labels ((instances-in (lst)
			 (cond ((null lst) 0)
			       ((listp (first lst))
				(+ (instances-in (first lst))
				   (instances-in (rest lst))))
			       ((equal obj (first lst))
				(1+ (instances-in (rest lst))))
			       (t (instances-in (rest lst))))))
    (mapcar #'instances-in lsts)))

(count-instances 'a '((a b c a) (a a a) ((a))))

;; ====================
;; 2.8 Tail-Recursion

; This is tail recursion

(defun our-find-if (fn lst)
  (if (funcall fn (car lst))
      (car lst)
    (our-find-if fn (cdr lst))))

; while it is not tail recursion

(defun our-length (lst)
  (if (null lst)
      0
    (1+ (our-length (rest lst)))))

(defun our-length-tail (lst)
  (labels ((rec (lst acc)
		(if (null lst)
		    acc
		  (rec (rest lst) (1+ acc)))))
    (rec lst 0)))

;; ====================
;; 2.9 Compilation

(defun foo (x)
  (1+ x))

(compiled-function-p #'foo)

(compile 'foo)

(compile nil
	 '(lambda (x) (+ x 2)))

(progn (compile 'bar '(lambda (x) (* x 3)))
       (compiled-function-p #'bar))

(compile 'make-adder)

(compiled-function-p (make-adder 2)) ;return true

(defun 50th (lst)
  (nth 49 lst))

(proclaim '(inline 50th))

(defun foo (lst)
  (+ (50th lst) 1))

; we foo is compiled, the code for 50th should be
; compiled right into it.


