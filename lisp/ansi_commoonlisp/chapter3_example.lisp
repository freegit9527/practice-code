;;; ANSI Common LISP

;;; Chapter 3 Lists


;; 3.1 Conses

(defun our-listp (x)
  (or (null x)
      (consp x)))

(defun our-atom (x)
  (not (consp x)))

;; 3.2 Equality

(eql (cons 'a nil)
     (cons 'a nil)) ; return nil

(setf x (cons 'a nil))

(eql x x) ; return t.

; eql returns true only if its arguments are
; the same object.
; equal returns true if its arguments would
; print the same.

(equal x (cons 'a nil))

(defun our-equal-lst (x y)
  (or (eql x y)
      (and (consp x)
	   (consp y)
	   (our-equal-lst (car x)
			  (car y))
	   (our-equal-lst (cdr x)
			  (cdr y)))))

;; 3.3 Why Lisp Has No Pointers

(setf x '(a b c))

(setf y x)

(eql x y) ; return t

;; 3.4 Building Lists

(setf x '(a b c)
      y (copy-list x))

(defun our-copy-list (lst)
  (if (atom lst)
      lst
    (cons (car lst)
	  (our-copy-list (cdr lst)))))

(append '(a b) '(c d) '(e))

;; 3.5 Example: Compression

; compress

(defun n-elts (elt n)
  (if (> n 1)
      (list n elt)
    elt))

(defun compr (elt n lst)
  (if (null lst)
      (list (n-elts elt n))
    (let ((next (car lst)))
      (if (equal next elt)
	  (compr elt (1+ n) (cdr lst))
	(cons (n-elts elt n)
	      (compr next 1 (cdr lst)))))))

(defun compress (x)
  (if (consp x)
      (compr (car x) 1 (cdr x))
    x))


; uncompress

(defun list-of (n elt)
  (if (zerop n)
      nil
    (cons elt
	  (list-of (1- n) elt))))

(defun uncompress (lst)
  (if (null lst)
      nil
    (let ((elt (car lst))
	  (rest (uncompress (cdr lst))))
      (if (consp elt)
	  (append (apply #'list-of elt)
		  rest)
	(cons elt rest)))))


;; 3.6 Access

(nth 0 '(a b c))

(nthcdr 2 '(a b c))

(defun our-nthcdr (n lst)
  (if (zerop n)
      lst
    (our-nthcdr (1- n) (cdr lst))))

;; 3.7 Mapping Functions

(mapcar #'(lambda (x)
	    (+ x 10))
	'(1 2 3))

(mapcar #'list
	'(a b c)
	'(1 2 3 4))

(maplist #'(lambda (x)
	     x)
	 '(a b c))

;; 3.8 Trees

(defun our-copy-tree (tr)
  (if (atom tr)
      tr
    (cons (our-copy-tree (car tr))
	  (our-copy-tree (cdr tr)))))

(defun our-subst (new old tree)
  (if (equal tree old)
      new
    (if (atom tree)
	tree
      (cons (our-subst new old (car tree))
	    (our-subst new old (cdr tree))))))

;; 3.9 Understanding Recursion

;; 3.10 Sets

(member '(a)
	'((a) (z))
	:test #'equal)

(member 'a '((a b) (c d))
	:key #'car)

(member 2 '((1) (2))
	:key #'car
	:test #'equal)

(member-if #'oddp '(2 3 4))

(defun our-member-if (fn lst)
  (and (consp lst)
       (if (funcall fn (car lst))
	   lst
	 (our-member-if fn (cdr lst)))))

(adjoin 'b '(a b c))

(adjoin 'z '(a b c))

(union '(a b c) '(c b s))

(intersection '(a b c)
	      '(b b c))

(set-difference '(a b c d e)
		'(b e))

;; 3.11 Sequences

(subseq '(a b c d) 1 2)

(subseq '(a b c d) 1)

(reverse '(a b c))

(defun mirror? (s)
  (let ((len (length s)))
    (and (evenp len)
	 (let ((mid (/ len 2)))
	   (equal (subseq s 0 mid)
		  (reverse  (subseq s mid)))))))

(mirror? '(a b b a))

(sort '(0 2 1 3 8) #'>) ; it is destructive!

(defun nthmost (n lst)
  (nth (1- n)
       (sort (copy-list lst) #'>)))

(nthmost 2 '(0 2 1 3 8))

(every #'oddp '(1 3 5))

(some #'evenp '(1 2 3))

(every #'> '(1 3 5)
       '(0 2 4))

;; 3.12 Stacks

(defun our-reverse (lst)
  (let ((acc nil))
    (dolist (elt lst)
      (push elt acc))
    acc))

(our-reverse '(a b c d))

(let ((x '(a b)))
  (pushnew 'c x)
  (pushnew 'a x)
  x)
; c gets pushed onto the list, but a, because it is
; already a member, does not.

;; 3.13 Dotted Lists

(defun proper-list? (x)
  (or (null x)
      (and (consp x)
	   (proper-list? (cdr x)))))

;; 3.14 Assoc-lists

(setf trans '((+ . "add")
	      (- . "subtract")))

(assoc '+ trans)

(defun our-assoc (key alist)
  (and (consp alist)
       (let ((pair (car alist)))
	 (if (eql key (car pair))
	     pair
	   (our-assoc key (cdr alist))))))


;; 3.15 Example: Shortest Path

(defun new-paths (path node net)
  (mapcar #'(lambda (n)
	      (cons n path))
	  (cdr (assoc node net))))
