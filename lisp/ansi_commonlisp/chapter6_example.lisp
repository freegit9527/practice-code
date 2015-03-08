;;;; Chapter 6 Functions

;;; 6.1 Global Functions

(fboundp '+)

(symbol-function '+)

(setf (symbol-function 'add2)
      #'(lambda (x)
	  (+ x 2)))

;; equals to

(defun add2-1 (x)
  (+ x 2))

(defun primo (lst)
  (car lst))


(defun (setf primo1) (val lst))
