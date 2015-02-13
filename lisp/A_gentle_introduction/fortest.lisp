
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
  (cond ((or (null small)
	     (null big)
	     (> (length small)
		(length big)))
	 nil)
	(t (do ((sm small (rest sm))
		(bi big (rest bi)))
	       ((null sm) t)
	     (unless (equal (first sm) (first bi))
	       (return nil))))))
	
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

;; h.

(defun prefix (n lst)
  (if (or (> n (length lst))
	  (zerop n))
      nil
      (do ((result nil)
	   (i 0 (incf i)))
	  ((equal i n) (reverse result))
	(push (pop lst) result))))


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
	      
    
