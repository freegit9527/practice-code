;;; ANSI Common LISP
;;; chapter 2 WELCOME TO LISP

;; ====================
;; 2.13 Iteration

(defun show-square (start end)
  (do ((i start (1+ i)))
      ((> i end) 'done)
    (format t "~A ~A~%" i (* i i))))

(defun show-squares (i end)
  (if (> i end)
      'done
    (progn
      (format t "~A ~A~%" i (* i i))
      (show-squares (1+ i) end))))

(defun our-length (lst)
  (let ((len 0))
    (dolist (obj lst)
      (setf len (1+ len)))
    len))

(defun our-length-rec (lst)
  (if (null lst)
      0
    (1+ (our-length-rec (rest lst)))))

(defun split-number (n)
  (do* ((i n quotient))
      ((zerop i) 'done)
    (setf (values quotient remainder) (floor i 10))
    (format t "~S~%" remainder)))

;; ====================
;; 2.14 Functions as Objects

(function +)

(apply #'+ '(1 2 3))

(apply #'+ 1 2 '(3 4 5))

(apply #'(lambda (a b)
	   (* a b))
       '(3 4))

;does not need the arguments to be packaged in a list
(funcall #'+ 1 2 3) 

(funcall #'(lambda (x)
	     (+ x 100)) 1)

(funcall #'(lambda (a b)
	     (* a b))
	 3 4)
	 
