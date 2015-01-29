;;; ##############################
;;;                              #
;;;     chapter 11 Iteration     #
;;;      and Block Structure     #
;;;          Example Code        #
;;;                              #
;;; ##############################



;; ==============================
;; ==============================

;; 11.2 DOTIMES AND DOLIST

(dotimes (i 4)
  (format t "~&I is ~S." i))

(dolist (x '(red blue green) 'flowers)
  (format t "~&Roses are ~S." x))


;; ==============================
;; ==============================

;; 11.3 EXITING THE BODY OF A LOOP

(defun find-first-odd (lst)
  (dolist (x lst nil)
    (format t "~&Testing ~S..." x)
    (when (oddp x)
      (format t
	      "found an odd number.")
      (return x))))

(find-first-odd '(2 4 6 7 8))
(find-first-odd '(2 4 6 8 10))

(defun check-all-odd (lst)
  (dolist (x lst t)
    (format t
	    "~&Checking ~S..." x)
    (when (not (oddp x))
      (format t "found a non-odd.")
      (return nil))))

(check-all-odd '(1 3 5))
(check-all-odd '(1 3 4 5))


;; ==============================
;; ==============================

;; 11.4 COMPARING RECURSIVE AND ITERATIVE SEARCH

(defun rec-ffo (x)
  "Recursively find first odd number in a list."
  (cond ((null x) nil)
	((oddp (first x)) (first x))
	(t (rec-ffo (rest x)))))

(defun it-ffo (lst)
  "Iteratively find first odd number in a list."
  (dolist (x lst)
    (if (oddp x) (return x))))



;; ==============================
;; ==============================

;; 11.5 BUILDING UP RESULTS WITH ASSIGNMENT

(defun it-fact (n)
  (let ((result 1))
    (dotimes (x n result)
      (setf result (* result (1+ x))))))

(defun it-intersection (lstx lsty)
  (let ((result nil))
    (dolist (x lstx result)
      (when (member x lsty)
;	(setf result (cons x result))))))
	(push x result)))))

;; ==============================
;; ==============================

;; 11.7 THE DO MACRO

(defun launch (n)
  (do ((cnt n (1- cnt)))
      ((zerop cnt) (format t "Blast off!"))
    (format t "~S..." cnt)))

(launch 10)

;; ==============================
;; ==============================

;; 10.8

(defun find-matching-elements (x y)
  "Searching x and y for elements that match."
  (do ((x1 x (rest x1))
       (y1 y (rest y1)))
      ((or (null x1) (null y1)) nil)
    (if (equal (first x1)
	       (first y1))
	(return (first x1)))))

(find-matching-elements
 '(b i r d)
 '(c a r p e t))

;; ==============================
;; ==============================

;; 11.9

(defun ffo-with-do* (list-of-numbers)
  "find the first odd number in a list"
  (do* ((x list-of-numbers (rest x))
	(e (first x) (first x)))
       ((null x) nil)
    (if (oddp e) (return e))))

(ffo-with-do* '(2 4 6 7 8))

;; ==============================
;; ==============================

;; 11.10 INFINITE LOOPS WITH DO

(defun read-a-number ()
  "Read a number from keyboard"
  (do ((answer nil))
      (nil)
    (format t "~&Please type a number: ")
    (setf answer (read))
    (if (numberp answer)
	(return answer)
	(format t "~&Sorry, ~S is not a number. Try again."
		answer))))

(read-a-number)

;; ==============================
;; ==============================

;; 11.11 IMPLICIT BLOCKS

(defun find-first-odd (x)
  "use of block name"
  (format t "~&Searching for an odd number...")
  (dolist (element x)
    (when (oddp element)
      (format t "~&Found ~S." element)
      (return-from find-first-odd element)))
  (format t "~&None found.")
  'none)

(find-first-odd '(2 4 6 7 8))
(find-first-odd '(2 4 6 8 10))

(defun square-list (x)
  (mapcar #'(lambda (e)
	      (if (numberp e)
		  (* e e)
		  (return-from square-list 'nope)))
	  x))

(square-list '(1 2 3 4 5))
(square-list '(1 2 three four 5))


