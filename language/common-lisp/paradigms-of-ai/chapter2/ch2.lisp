(defun random-elt (choices)
  "choose an element from a list at random."
  (elt choices (random (length choices))))

(defun one-of (set)
  "Pick one element of set, and make a list of it."
  (list (random-elt set)))

(defun Verb ()
  (one-of '(hit took saw liked)))

(defun Noun ()
  (one-of '(man ball woman table)))

(defun Article ()
  (one-of '(the a)))

(defun Adj ()
  (one-of '(big little blue green adiabatic)))

(defun Adj* ()
  (if (zerop (random 2))
      nil
      (append (Adj)
              (Adj*))))

(defun Prep ()
  (one-of '(to in by with on)))

(defun PP ()
  (append (Prep)
          (noun-phrase)))

(defun PP* ()
  (if (random-elt '(t nil))
      (append (PP) (PP*))
      nil))

(defun noun-phrase ()
  (append (Article) (Adj*)
          (Noun) (PP*)))

(defun verb-phrase ()
  (append (Verb)
          (noun-phrase)))

(defparameter *simple-grammar*
  '((sentence -> (noun-phrase verb-phrase))
    (noun-phrase -> (Article Noun))
    (verb-phrase -> (Verb noun-phrase))
    (Article -> the a)
    (Noun -> man ball woman table)
    (Verb -> hit took saw liked))
  "A grammar for a trivial subset of English.")

(defvar *grammar* *simple-grammar*
  "The grammar used by generate.
Initially, this is *simple-grammar*, but we can
switch to other grammars.")

(defun rule-lhs (rule)
  "The left-hand side of a rule."
  (first rule))

(defun rule-rhs (rule)
  "The right-hand side of a rule."
  (cddr rule))

(defun rewrites (category)
  "Return a list of the possible rewrites for
this category."
  (rule-rhs (assoc category *grammar*)))

(defun sentence ()
  (append (noun-phrase)
          (verb-phrase)))
