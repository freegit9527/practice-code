(ql:quickload :lispbuilder-sdl)
(asdf:operate 'asdf:load-op :lispbuilder-sdl)
(asdf:operate 'asdf:load-op :cocoahelper)

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
                         (when (sdl:key-state-p :sdl-key-escape)
                           (sdl:push-quit-event)
                           (sb-ext:exit)))))))

(defun main (argv &aux (argc (length argv)))
  (draw-a-box-in-window))

(sb-int:with-float-traps-masked
    (:invalid :inexact :overflow)
  (main *posix-argv*))
