;;; ANSI Common LISP
;;; chapter 2 WELCOME TO LISP

;2.
(cons 'a (cons'b (cons'c nil)))
(cons 'a (cons 'b '(c)))
(cons 'a '(b c))

;3.
(defun get-fourth (lst)
  (cadr (cdr (cdr lst))))

(get-fourth '(a b c d e))

; 4.
(defun greater (a b)
	 (if (> a b)
	     a
	   b))

(greater 2 3)

; 7.

(defun ele-list (lst)
  (dolist (obj lst)
    (if (listp obj)
	(return t))))

; 8.

; (a)
(defun print-dots (n)
  (do ((i 0 (1+ i)))
      ((= i n) t)
    (format t ".")))

(defun print-dots-rec (n)
  (if (zerop n)
      t
    (progn
      (format t ".")
      (print-dots-rec (1- n)))))

; (b)
(defun number-occur (lst)
  (labels ((my-count (item)
		     (let ((cnt 0))
		       (dolist (it lst)
			       (if (equal it item)
				   (setf cnt (1+ cnt))))
		       cnt)))
    (mapcar #'my-count lst)))


