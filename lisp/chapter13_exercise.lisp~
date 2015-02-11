;;; ##############################
;;;                              #
;;;     chapter 13 Arrays,       #
;;;      Hash Tables, And        #
;;;       Property Lists         #
;;;        Exercise code         #
;;;         2015/01/11           #
;;;                              #
;;; ##############################



;; ==============================
;; ==============================

;; 13.1

(defun subprop (sym elem prop)
  (setf (get sym prop)
        (remove elem (get sym prop))))

(setf (get 'alpha 'fooprop) '(a b c d e))
(subprop 'alpha 'd 'fooprop)
(get 'alpha 'fooprop)

;; 13.2

(defun forget-meeting (persona personb)
  (subprop persona personb 'has-met)
  (subprop personb persona 'has-met)
  t)

(symbol-plist 'little-red)
(symbol-plist 'wolfie)
(symbol-plist 'grandma)

(forget-meeting 'wolfie 'grandma)
(get 'wolfie 'has-met)
(get 'grandma 'has-met)

;; 13.3

(defun my-get (sym prop)
  (second (member prop (symbol-plist sym))))

(my-get 'little-red 'has-met)
(get 'little-red 'has-met)

;; 13.4

(defun hasprop (sym prop)
  (do* ((prop-list (symbol-plist sym) (nthcdr 2 prop-list)))
       ((equal prop (first prop-list)) t)
    (when (null prop-list)
      (return nil))))

(hasprop 'little-red 'has-met)
(hasprop 'little-red 'has)

