; 12.3 example

(defun print-starship (x stream depth)
  (format stream "#<starship ~A>"
	  (starship-name x)))

(defstruct (starship
	     (:print-function print-starship))
  (name nil)
  (speed 0)
  (condition 'green)
  (shields 'down))

(setf s2 '#s(starship speed (warp 3)
		      condition red
		      shields up))

(setf s1 '#s(starship speed 100))

(setf s3 (make-starship :name "Aries"))

(format t "~&This is ~S leaving orbit." s3)

(defstruct ship
  (name nil)
  (captain nil)
  (crew-size nil))

(defstruct (supply-ship (:include ship))
  (cargo nil))

(setf z1 (make-supply-ship
	  :captain "Harry Mudd"))
