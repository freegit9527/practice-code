(defclass circle ()
  ((radius :accessor circle-radius
            :initform 1
            :initarg :radius)
   (center :accessor circle-center
           :initform (cons 1 1)
           :initarg :center)))

(defclass rectangle ()
  (width length))

(defmethod area ((x circle))
  (* pi (expt (slot-value x 'radius) 2)))

(let ((x (make-instance 'circle)))
  (setf (slot-value x 'radius) 3)
  (area x))

