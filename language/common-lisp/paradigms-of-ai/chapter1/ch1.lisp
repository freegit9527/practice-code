;; chapter 1
;; Introduction to Lisp
;; You think you know when you learn, are more sure when
;; you can write, even more when you can teach, but
;; certain when you can program.  -- Alan Perlis

(setf p '(john q public))
;; (JOHN Q PUBLIC)
(cons 'Mr p)
;; (MR JOHN Q PUBLIC)
(setf town (list 'Anytown 'USA))
;; (ANYTOWN USA)
(list p 'of town 'may 'have 'already 'won!)
;; ((JOHN Q PUBLIC)
;;  OF
;;  (ANYTOWN USA)
;;  MAY
;;  HAVE
;;  ALREADY
;;  WON!)
(append p 'of town 'may 'have 'already 'won!)

(defun last-name (name)
  "Select the last name from a name represented as a list."
  (first (last name)))
