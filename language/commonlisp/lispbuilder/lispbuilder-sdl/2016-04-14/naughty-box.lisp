(ql:quickload :lispbuilder-sdl)

(defun naughty-box ()
  (sdl:with-init
      (let ((width 500)
            (height 500))
        (sdl:window width height)
        (sdl:clear-display (sdl:color))
        (sdl:with-events ()
          ()))))
