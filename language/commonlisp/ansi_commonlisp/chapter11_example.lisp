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
