;;; ANSI Common LISP

;;; Chapter 4 Specialized Data Structures

;; 4.1 Arrays

(setf arr (make-array '(2 3)
		      :initial-element nil))

(aref arr 0 0)

(setf (aref arr 0 0) 'b)

(aref arr 0 0)

(setf arr1 #2a ((a nil nil) (b nil nil)))

(setf *print-array* t)

(setf vec (make-array 4
		      :initial-element nil))

(setf vec1 (vector "a" 'b 3))

(svref vec1 1)

;; 4.2 Example: Binary Search

(defun finder (obj vec start end)
  (format t "~A~%"
	  (subseq vec start (1+ end)))
  (let ((range (- end start)))
    (if (zerop range)
	(if (equal obj (aref vec start))
	    obj
	  nil)
      (let ((mid (+ start
		    (round (/ range 2)))))
	(let ((obj2 (aref vec mid)))
	  (if (< obj obj2)
	      (finder obj vec start (- mid 1))
	    (if (> obj obj2)
		(finder obj vec (+ mid 1) end)
	      obj)))))))


(defun bin-search (obj vec)
  (let ((len (length vec)))
    (and (not (zerop len))
	 (finder obj vec 0 (1- len)))))

(bin-search 6 #(0 1 2 3 4 5 6 7 8 9))

;;; 4.3 Strings and Characters

(sort "elbow" #'char<)

(aref "abc" 1)

(char "abc" 1)

(let ((str (copy-seq "Merlin")))
  (setf (char str 3) #\k)
  str)

(equal "fred" "fred") ; return t

(equal "fred" "Fred") ; return nil

;; ignore case
(string-equal "fred" "Fred")

(format nil "~A or ~A"
	"truth" "dare") ; it builds a string.

(concatenate 'string
	     "not " "to worry")

;;; 4.4 Sequences

(elt '(a b c) 1)

(defun mirror? (s)
  (let ((len (length s)))
    (and (evenp len)
	 (do ((forward 0 (1+ forward))
	      (back (1- len) (1- back)))
	     ((or (> forward back)
		     (not (eql (elt s forward)
			       (elt s back))))
	      (> forward back))))))

(mirror? "abba")

(position #\a "fantasia")

(position #\a "fantasia"
	  :start 3
	  :end 5)

(position #\a "fantasia"
	  :from-end t)

(position 'a
	  '((c d) (a b))
	  :key #'car)

(position '(a b)
	  '((a b) (c d))) ; return nil

(position '(a b)
	  '((a b) (c d))
	  :test #'equal) ; return 0

(position 3 '(1 0 7 5)
	  :test #'<) ; return 2

(defun second-word (str)
  (let ((p1 (1+ (position #\  str))))
    (subseq str p1 (position #\  str :start p1))))

(second-word "Form follows function.")

(position-if #'oddp '(2 3 4 5))

(position-if #'oddp '(2 4 6 8))

(find #\a "cat")

(find-if #'characterp "ham")

(setf lst '((complete success) (a day)))

(find-if #'(lambda (x)
	     (eql (car x) 'complete))
	 lst)

;; equals to:

(find 'complete lst :key #'car)

(remove-duplicates "abracdabra")

(reduce #'+ '(1 2 3 4))

(reduce #'intersection '((b r a d 's)
			 (b a d)
			 (c a t)))

;;; 4.5 Example: Parsing Dates

(defun constituent (c)
  (and (graphic-char-p c)
       (not (char= c #\ ))))

(defun tokens (str test start)
  (let ((p1 (position-if test str :start start)))
    (if p1
	(let ((p2 (position-if #'(lambda (c)
				   (not (funcall test c)))
			       str :start p1)))
	  (cons (subseq str p1 p2)
		(if p2
		    (tokens str test p2)
		  nil)))
      nil)))

(tokens "ab12 3cde.f" #'alpha-char-p 0)

(tokens "ab12 3cde.f
gh" #'constituent 0)

(defconstant month-names
  #("jan" "feb" "mar" "apr" "may"
    "jun" "jul" "aug" "sep" "oct"
    "nov" "dec"))

(defun parse-month (str)
  (let ((p (position str month-names
		     :test #'string-equal)))
    (if p
	(1+ p)
      nil)))

(defun my-read-integer (str)
  (if (every #'digit-char-p str)
      (let ((accum 0))
	(dotimes (pos (length str))
	  (setf accum (+ (digit-char-p (char str pos))
			 (* 10 accum))))
	accum)
    nil))

(defun parse-date (str)
  (let ((toks (tokens str #'constituent 0)))
    (list (my-read-integer (first toks))
	  (parse-month (second toks))
	  (my-read-integer (third toks)))))


;;; 4.6 Structures

(defstruct point
  x
  y)

(setf p (make-point :x 0
		    :y 0))

(point-x p)

(setf (point-y p) 2) ; set y of p to 2

(point-p p)

(typep p 'point)

(defstruct polemic
  (type (progn
	  (format t "What kind of polemic was it? ")
	  (read)))
  (effect nil))

;;(make-polemic)

(defstruct (point (:conc-name p)
		  (:print-function print-point))
  (x 0)
  (y 0))

(defun print-point (p stream depth)
  (format stream "#<~A ~A>" (px p) (py p)))

(make-point)


;;; 4.7 Example: Binary Search Trees

(defstruct (node (:print-function
		  (lambda (n s d)
		    (format s "#<~A ~A ~A>" (node-elt n)
			    (node-l n)
			    (node-r n)))))
  elt (l nil) (r nil))

(defun bst-insert (obj bst comp)
  (if (null bst)
      (make-node :elt obj)
    (let ((elt (node-elt bst)))
      (if (eql obj elt)
	  bst
	(if (funcall comp obj elt)
	    (progn (setf (node-l bst) (bst-insert obj (node-l bst) comp))
		   bst)
	  (progn
	    (setf (node-r bst) (bst-insert obj (node-r bst) comp))
	    bst))))))

(defun bst-find (obj bst comp)
  (if (null bst)
      nil
    (let ((elt (node-elt bst)))
      (if (eql obj elt)
	  bst
	(if (funcall comp obj elt)
	    (bst-find obj (node-l bst) comp)
	  (bst-find obj (node-r bst) comp))))))

(defun bst-min (bst)
  (and bst
       (or (bst-min (node-l bst))
	   bst)))

(defun bst-max (bst)
  (and bst
       (or (bst-max (node-r bst))
	   bst)))

(setf nums nil)

(dolist (x '(5 8 4 2 1 9 6 7 3))
  (setf nums (bst-insert x nums #'<)))

(defun rperc (bst)
  (make-node :elt (node-elt (node-r bst))
	     :l (node-l bst)
	     :r (percolate (node-r bst))))

(defun lperc (bst)
  (make-node :elt (node-elt (node-l bst))
	     :l (percolate (node-l bst))
	     :r (node-r bst)))

(defun percolate (bst)
  (cond ((null (node-l bst))
	 (if (null (node-r bst))
	     nil
	   (rperc bst)))
	((null (node-r bst))
	 (lperc bst))
	(t (if (zerop (random 2))
	       (lperc bst)
	     (rperc bst)))))

(defun bst-remove (obj bst comp)
  (if (null bst)
      nil
    (let ((elt (node-elt bst)))
      (if (eql obj elt)
	  (percolate bst)
	(if (funcall < obj elt)
	    (make-node
	     :elt elt
	     :l (bst-remove obj (node-l bst) comp)
	     :r (node-r bst))
	  (make-node
	   :elt elt
	   :r (bst-remove obj (node-r bst) comp)
	   :l (node-l bst)))))))

(defun bst-traverse (fn bst)
  (when bst
    (bst-traverse fn (node-l bst))
    (funcall fn (node-elt bst))
    (bst-traverse fn (node-r bst))))

;;; 4.8 Hash Tables

(setf ht (make-hash-table))

(gethash 'color ht)


