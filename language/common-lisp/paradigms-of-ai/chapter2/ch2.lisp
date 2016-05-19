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

(defun noun-phrase ()
  (append (Article)
          (Noun)))

(defun verb-phrase ()
  (append (Verb)
          (noun-phrase)))

(defun sentence ()
  (append (noun-phrase)
          (verb-phrase)))
