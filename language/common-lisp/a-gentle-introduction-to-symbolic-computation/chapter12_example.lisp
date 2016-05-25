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

<<<<<<< HEAD
(setf s3 '#s(starship 
	     speed 250 
	     name aries))

	     


=======
(setf s2 '#s(starship
	     name "aries"
	     condition 'red
	     speed (add 100)))

;; 12.4 TYPE PREDICATES FOR STRUCTURES

(starship-p s2) ;; T

(type-of s2) ;; starship

(typep s2 'starship) ;; T

;; 12.5 ACCESING AND MODIFYING STRUCTURES

(starship-speed s2)
(starship-shields s2)

(setf (starship-speed s1) 1)

(incf (starship-speed s1))

(defun alert (x)
  (setf (starship-shields x) 'up)
  (if (equal (starship-condition x) 'green)
      (setf (starship-condition x) 'yellow))
  'shields-raised)

(alert s1)

;; 12.6 KEYWORD ARGUMENT TO CONSTRUCTOR FUNCTIONS

(setf s3 (make-starship :name "MU"
                        :shields 'damaged))

;; CHANGING STRUCTURE DEFINITIONS

(defstruct starship 
  (captain nil)
  (name nil)
  (shields 'down)
  (condition 'green)
  (speed 0))

;; we have to redifine s1 s2 and s3

(setf s3 (make-starship :name "MU"
                        :shields 'damaged
                        :captain "SUCCESS"))

;; Lisp Toolkit: DESCRIBE and INSPECT

(describe 7)
(describe 'fred)
(describe t)
(describe 'cons)
(describe s3)

(inspect 'half)

;; 12.8 PRINT FUNCTIONS FOR STRUCTURES

(defun print-starship (x stream depth)
  (format stream "<starship ~A>"
          (starship-name x)))

(defstruct (starship
            (:print-function print-starship))
  (captain nil)
  (name nil)
  (shields 'down)
  (condition 'green)
  (speed 0))

(setf s4 (make-starship 
          :name "Phoenix Ikki"))

(starship-shields s4)

(format t "~&This is ~S leaving orbit." s4)

(defun print-captain (x stream depth)
  (format stream "#<CAPTAIN ~S>" (captain-name x)))

(defstruct (captain 
            (:print-function print-captain))
  name
  age
  ship)

(setf jim (make-captain
           :name "James T. Kirk"
           :ship "Enterprise"
           :age 35))

(setf s1 (make-starship
          :name "Enterprise"))

(setf (starship-captain s1) jim)

;; 12.9 EQUALITY OF STRUCTURES

(setf s5 (make-starship))

(setf s6 (make-starship))

(equal s5 s6)

(equalp s5 s6)

(equalp s5 '#s(starship
               name nil
               speed 0
               condition green
               shields down))


;; 12.10 INHERITANCE FROM OTHER STRUCTURES

(defstruct ship
  (name nil)
  (captain nil)
  (crew-size nil))

(defstruct (starship (:include ship))
  (weapons nil)
  (shields nil))

(defstruct (supply-ship (:include ship))
  (cargo nil))

(setf z1 (make-starship 
          :captain "James T. Kirk"))

(setf z2 (make-supply-ship
          :captain "Harry Mudd"))

(ship-p z1)
(starship-p z1)
(supply-ship-p z1)
