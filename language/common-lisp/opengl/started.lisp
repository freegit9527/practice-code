(ql:quickload :cl-opengl)
(ql:quickload :lispbuilder-sdl-image)
(ql:quickload :lispbuilder-sdl)

(defmacro restartable (&body body)
  "helper macro since we use continue restarts a lot
  (remember to his C in slime or pick the restart so errors
  don't kill the app)"
  `(restart-case
       (progn ,@body)
     (continue () :report "Continue")))
