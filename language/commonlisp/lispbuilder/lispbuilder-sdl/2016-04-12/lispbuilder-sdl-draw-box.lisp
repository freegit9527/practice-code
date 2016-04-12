(ql:quickload :lispbuilder-sdl)
(defun draw-a-box-in-window ()
  (sdl:with-init
      ()
    (let ((width 500)
          (height 500))
      (sdl:window width height)
      (setf (sdl:frame-rate) 60)
      (sdl:clear-display
       (sdl:color
        :r 127
        :g 127
        :b 127))
      (sdl:draw-box
       (sdl:rectangle
        :x (floor (/ width 3))
        :y (floor (/ height 3))
        :w (floor (/ height 3))
        :h (floor (/ height 3)))
       :color (sdl:color
               :r 200
               :g 200
               :b 200))
      (sdl:update-display)
      (sdl:with-events
          ()
        (:quit-event () t)
        (:key-down-event ()
                         (when (sdl:key-down-p :sdl-key-q)
                           (sdl:push-quit-event)))))))
(draw-a-box-in-window)
