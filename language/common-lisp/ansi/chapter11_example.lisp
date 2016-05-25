;; Chapter 11. CLOS

;;; 11.1 Object-Oriented Programming

(defstruct rectangle
  height width)

(defstruct circle
  radius)

(defun area (x)
  (cond ((rectangle-p x)
         (* (rectangle-height x) (rectangle-width x)))
        ((circle-p x)
         (* pi (expt (circle-radius x)) 2))))

(let ((r (make-rectangle)))
  (setf (rectangle-height r) 2
        (rectangle-width r) 3)
  (area r))

(defclass class-rectangle ()
  (height width))

(defclass class-circle ()
  (radius))

(defmethod class-area ((x class-rectangle))
  (* (slot-value x 'height) (slot-value x 'width)))

(defmethod class-area ((x class-circle))
  (* pi (expt (slot-value x 'radius) 2)))

(let ((r (make-instance 'class-rectangle)))
  (setf (slot-value r 'height) 2
        (slot-value r 'width) 3)
  (class-area r))

;; 11.7 Auxiliary Methods

(defclass speaker ()
  ())

(defmethod speak ((s speaker) string)
  (format t "~A" string))

(defmethod speak :before ((s speaker)
                          string)
  (princ "I think "))
;; end of class speaker

(speak (make-instance 'speaker) "I'm hungry")

(defclass intellectual (speaker) ())

(defmethod speak :before ((i intellectual)
                            string)
  (format t "~&Perhaps "))

(defmethod speak :after ((i intellectual)
                           string)
  (princ " in some sense"))
;; end of intellectual class

(speak (make-instance 'intellectual) "I'm hungry")

;; start of courtier class
(defclass courtier (speaker)
  ())

(defmethod speak :around ((c courtier)
                          string)
  (format t "~&Does the King believe that ~A? " string)
  (if (eql (read)
           'yes)
      (if (next-method-p)
          (call-next-method))
      (format t "Indeed, it is a preposterous idea.~%"))
  'bow)

(speak (make-instance 'courtier) "kings will last")

;; with-slots
(defclass thing ()
  ((x :initarg :x
      :accessor thing-x)
   (y :initarg :y
      :accessor thing-y)))

(defmethod (setf thing-x))
