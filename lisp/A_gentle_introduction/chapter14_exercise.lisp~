;;; ##############################
;;;                              #
;;;     chapter 14 Macros,       #
;;;      and Compilation         #
;;;        Exercise code         #
;;;         2015/01/12           #
;;;                              #
;;; ##############################



;; ==============================
;; ==============================

;; 14.3

(defmacro set-nil (var)
  (list 'setq var nil))

(setf a 3)
(set-nil a)

;; 14.4

(defmacro simple-rotatef (a b)
  `(let ((tmp ,a)
         (tmp1 ,b))
     (setf ,a tmp1)
     (setf ,b tmp)))

(setf a 2)
(setf b 7)
(simple-rotatef a b)