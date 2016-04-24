;;; Chapter 2. BASIC LISP

(setf colors (list '(red 0) '(blue 5) '(green 9)))
(assoc 'blue colors)
(setf colors (cons '(blue 7) colors))
(assoc 'blue colors)
(setf colors (append colors (list '(blue 9))))
(assoc 'blue colors)
(nth 0 '(+ (* 3 (** X 2)) (* 4 x) 6))
(nth 2 '(+ (* 3 (** X 2)) (* 4 x) 6))
(setf clown '((nose red) (expression frown) (name Freddy)))
(cadr (assoc 'name clown))
(cadr (assoc 'shoe-size clown))
(setf clown (cons '(shoe-size 27) clown))
(cadr (assoc 'shoe-size clown))

(setf poly-alist '((12 3) (6 5) (0 9)))
(assoc 6 poly-alist)
(assoc 1 poly-alist)
(cadr (assoc 0 poly-alist))
(cadr (assoc 1 poly-alist))

(setf polynomial '(-9 4 3))
(setf v 3)
(+ (car polynomial)
   (* (cadr polynomial) v)
   (* (caddr polynomial) (expt v 2)))

(defun evaluate-2nd-degree-polynomial (poly value)
  (+ (car poly)
     (* (cadr poly) value)
     (* (caddr poly) (expt value 2))))

(evaluate-2nd-degree-polynomial '(5 0 0) 15)
(evaluate-2nd-degree-polynomial '(2 3 4) 1)
(evaluate-2nd-degree-polynomial '(-9 4 3) 3)


;; exercise 2.13
(defun add-alist (key value alist)
  (cons (list key value)
	alist))

(add-alist 'yellow 7 '((red 4)))

;; exercise 2.14
(defun multiply-first-degree-polynomial (lst-1 lst-2)
  (list (* (car lst-1) (car lst-2))
	(+ (* (cadr lst-2) (car lst-1)) 
	   (* (cadr lst-1) (car lst-2)))
	(* (cadr lst-1) (cadr lst-2))))
    
(multiply-first-degree-polynomial '(2 3) '(1 3))


;; exercise 2.15
;;; WARNING! VERY POOR STYLE
(defun mystery (polynomial)
  #| (+ (caddr polynomila)
  (cadr |# (cadr polynomial)); ))

(mystery '(+ (* 3 x) 4))


;; chapter exercise
;;****************************************
;;****************************************

;; exercise 1.

(defun quadratic (a b c)
  (/ (+ (- b) (sqrt (- (* b b ) (* 4 a c))))
      (* 2 a)))

(quadratic 1 1 -6)

;; exercise 2.

(defun extract (lst n)
  (nth n lst))

(extract '(-6 1 2) 0)
(extract '(-6 1 2) 1)
(extract '(-6 1 2) 2)

;; exercise 3.

(defun one-root (lst)
  (quadratic (extract lst 2)
	     (extract lst 1)
	     (extract lst 0)))

(one-root '(-6 1 1))



;;;;-------------------------------------------------------------
;;;;-------------------------------------------------------------
;;;;-------------------------------------------------------------
;;;;-------------------------------------------------------------
;;;;-------------------------------------------------------------

;;; Chapter 3. CONDITIONALS, LOCALS, AND RECURSION

(atom nil)
(listp nil)

;; exercise 3.1

(defun atom-and-list (lst)
  (equal lst nil))

(atom-and-list 'first-coefficient)
(atom-and-list nil)


;; exercise 3.2

(setf polynomial-1 '(+ (* 2 x) 3))
(setf polynomial-2 '(+ (* 3 x) 2))

(equal polynomial-1 '(+ (* 2 x) 3))

(equal (cadr (cadr polynomial-1))
       (caddr polynomial-2))

(> (caddr polynomial-1) (cadr (cadr polynomial-2)))

(= (cadr (cadr polynomial-1)) (caddr polynomial-2)
   (cadr (cadr polynomial-2)))

(equal (append '(* 2 x) '(3)) (list '(* 2 x) '(3)))
(<= 1 (caddr polynomial-2) (caddr polynomial-1))

(equal (member 'red '(red blue green)) t)
(equal (member 'green '(red blue green)) '(green))

(defun listfy (argument)
  (cond ((listp argument) argument)
	(t (list argument))))

(listfy 44)
(listfy '(* 3))

(defun coefficient-from-term (term)
  (cond ((numberp term) term)
	((symbolp term) 1)
	((equal (car term) '*) (cadr term))
	((equal (car term) '**) 1)
	(t nil)))

(coefficient-from-term '(* 4 (** x 2)))
(coefficient-from-term 'x)
(coefficient-from-term 5)
