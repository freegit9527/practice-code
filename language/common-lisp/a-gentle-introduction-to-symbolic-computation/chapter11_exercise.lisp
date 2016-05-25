;;; ##############################
;;;                              #
;;;     chapter 11 Iteration     #
;;;      and Block Structure     #
;;;         Exercise Code        #
;;;                              #
;;; ##############################



;; ==============================
;; ==============================

;; Section 11.3 EXITING THE BODY OF A LOOP

;; EXERCISES

;; 11.1

(defun it-member-1 (x lst)
  (dolist (y lst nil)
    (when (equal y x)
      (format t
	      "~&~S is a member of ~S"
	      x lst)
      (return t))))

(defun it-member (item lst)
  (dolist (entry lst nil)
    (if (equal entry item) (return t))))

(it-member 'a '(b c d e a))
	      
;; 11.2
(defun it-assoc (x lst)
  (dolist (y lst nil)
    (when (equal x (first y))
      (return y))))

(it-assoc 'a '((b c) (a b) (d e)))

;; 11.3
(defun check-all-odd-rec (lst)
  (cond ((null lst) nil)
	(t (check-all-odd-help lst))))

(defun check-all-odd-help (lst)
  (cond ((null lst) t)
	(t
	 (format t "~&Checking ~S..."
		 (first lst))
	 (if (not (oddp (first lst)))
	     (progn
	       (format t
		       "found a non-odd")
	       nil)
	     (check-all-odd-help
	      (rest lst))))))

(check-all-odd-rec '(1 3 5))
(check-all-odd-rec '(1 3 4 5))
(check-all-odd-rec nil)

; Following is solution of author
(defun check-all-odd-author (x)
  (cond ((null x) t)
	(t (format t "~&Checking ~S..."
		   (first x))
	   (unless (evenp (first x))
	     (check-all-odd-author (rest x))))))

;; 11.4

(defun it-length (lst)
  (let ((len 0))
    (dolist (item lst len)
      (incf len))))

(it-length '(a b c))
(it-length nil)

;; 11.5

(defun it-nth (pos lst)
  (dotimes (index pos (first lst))
    (pop lst)))

(it-nth 1 '(a b c))
(it-nth 0 '(a b c))
(it-nth 5 '(a b c))

;; 11.6

(defun it-union (lst-a lst-b)
  (dolist (item lst-b lst-a)
    (unless (member item lst-a)
      (push item lst-a))))

(it-union '(a b c) '(d e f))

;; 11.8

(defun it-reverse (lst)
  (let ((result-lst nil))
    (dolist (item lst result-lst)
      (push item result-lst))))

(it-reverse '(a b c d))

;; 11.9

(defun check-all-odd (lst)
  (do ((tmp-lst lst (rest tmp-lst)))
      ((null tmp-lst) t)
    (format t "~&Checking ~S..." (first tmp-lst))
    (unless (oddp (first tmp-lst))
      (format t "find a odd number...")
      (return (first tmp-lst)))))

(check-all-odd '(1 3 5 7 2))

;; 11.10

(defun launch-dotimes (n)
  (dotimes (index n)
    (format t "~S..." (- n index)))
  (format t "Blast off!"))

(launch-dotimes 5)

;; 11.11

(defun find-largest (list-of-numbers)
  "find the largest number in a list"
  (do* ((largest (first list-of-numbers))
	(tmp-lst list-of-numbers (rest tmp-lst))
	(i (first tmp-lst) (first tmp-lst)))
       ((null tmp-lst) largest)
    (if (> i largest) (setf largest i))))

(find-largest '(1 2 3 4 9 0))

;; 11.12

(defun power-of-2 (n)
  "calculate 2^n"
  (do ((result 1 (* 2 result))
       (i n (1- i)))
      ((zerop i) result)))

(power-of-2 3)

;; 11.13

(defun first-non-integer (x)
  "Return the first non-integer element of x."
  (dolist (element x 'none)
    (unless (integerp element)
      (return element))))

(first-non-integer '(1 2 2 3 4.0 6))

;; 11.17

; the following expression returns 5!
(dotimes (i 5 i)
  (format t "~&I = ~S" i))

;; 11.18

(do ((i 0 (1+ i)))
    ((equal 5 i) i)
  (format t "~&I = ~S" i))

;; 11.21

(defun fib-n (n)
  (do* ((x 0 y)
	(y 1 z)
	(z (+ x y) (+ x y))
	(cnt n (1- cnt)))
       ((zerop cnt) x)))

(fib-n 1)
     
(dotimes (i 10)
  (format t "~&fib(~S) = ~S" i (fib-do i)))

(defun fib-do (n)
  (do ((cnt 0 (1+ cnt))
       (x 0 y)
       (y 1 (+ x y)))
      ((equal cnt n) x)))


;; keyboard exercise

;; 11.22

;; a.

(defun complement-base (base)
  (let ((lst '(a c g t))
	(len 4))
    (nth (1- (length (member base lst))) lst)))

(complement-base 'a)
(complement-base 't)
(complement-base 'c)
(complement-base 'g)

;; b.

(defun complement-strand (lst)
  (do* ((elem (first lst) (pop lst))
       (result nil (push (complement-base elem) result)))
       ((null lst) (nreverse result))))

(complement-strand '(a t c g))

;; c.

(defun make-double (lst)
  (do* ((elem (first lst) (pop lst))
	(result nil (push (list elem (complement-base elem))
			  result)))
       ((null lst) (nreverse result))))

(make-double '(g g a c t))

;; d.

(defun count-base-lst (elem lst)
  (setf new-lst (if (listp (first lst))
		    (reduce #'append lst)
		    lst))
  (count elem new-lst))

(defun count-bases (lst)
  (do* ((bases '(a t c g))
	(base (first bases) (first bases))
	(result nil))
       ((null bases) (nreverse result))
    (push (list base (count-base-lst base lst))
	  result)
    (pop bases)))

(count-bases '((g c) (a t) (t a) (t a) (c g)))
(count-bases '(a g t a c t c t))

;; e.

(defun prefixp (small big)
  (if (or (null small)
	  (null big)
	  (> (length small)
	     (length big)))
      nil
      (do ((el (first small) (first small))
	   (elem (first big) (first big)))
	  ((not (equal el elem)) nil)
	(pop small)
	(pop big)
	(if (or (null small)
		(null big))
	    (return t)))))

(prefixp '(g t c) '(g t c a t))
(prefixp '(g t c) '(a g g t c))

;; f.

(defun appearsp (small big)
  (if (or (null small)
	  (null big))
      nil
      (do ((big-rest big (rest big-rest)))
	  ((prefixp small big-rest) t)
	(if (or (null big-rest)
		(> (length small)
		   (length (rest big-rest))))
	    (return nil)))))

(appearsp '(c a t) '(t c a t g))
(appearsp '(c a t) '(t c c g t a))

;; g.

(defun coverp (small big)
  (if (or (null small)
	  (null big))
      nil
      (let ((small-len (length small))
	    (big-len (length big)))
	(if (zerop (rem big-len small-len))
	    (let ((times (/ big-len small-len))
		  (result nil))
	      (dotimes (i times)
		(setf result (append result small)))
	      (equal result big))
	    nil))))

;; coverp written by author...
(defun coverp-author (strand1 strand2)
  (do* ((len1 (length strand1))
	(s2 strand2 (nthcdr len1 s2)))
       ((null s2) t)
    (unless (prefixp strand1 s2)
      (return nil))))


;; h.

(defun prefix (n lst)
  (if (or (> n (length lst))
	  (zerop n))
      nil
      (do ((result nil)
	   (i 0 (incf i)))
	  ((equal i n) result)
	(push (pop lst) (reverse result)))))

;; i.

(defun kernel (lst)
  (do* ((i 1 (1+ i))
	(small (prefix i lst) (prefix i lst)))
       ((coverp small lst) small)))

;; h.

(defun draw-line (n)
  (dotimes (i (* 5 n))
    (format t "-"))
  (format t "~%"))

(defun draw-sym (n sym)
  (dotimes (i n)
    (format t "  ~A  " sym))
  (format t "~%"))

(defun draw-dna (lst)
  (let ((comp-lst (complement-strand lst)))
    (draw-line (length lst))
    (draw-sym (length lst) "!")
    (dotimes (i (length lst))
      (format t "  ~S  " (nth i lst)))
    (format t "~%")
    (draw-sym (length lst) ".")
    (draw-sym (length lst) ".")
    (dotimes (i (length comp-lst))
      (format t "  ~A  " (nth i comp-lst)))
    (format t "~%")
    (draw-sym (length lst) "!")
    (draw-line (length lst))))
