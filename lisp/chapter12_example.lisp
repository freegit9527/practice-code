;;; ##############################
;;;                              #
;;;     chapter 12 Structures    #
;;;      and The Type System     #
;;;          Example Code        #
;;;                              #
;;; ##############################



;; ==============================
;; ==============================

;; 12.3 DEFINING STRUCTURES

(defstruct starship
  (name nil)
  (speed 0)
  (condition 'green)
  (shields 'down))

(setf s1 (make-starship))

(setf s2 '#s(starship
