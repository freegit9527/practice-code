(ql:quickload :lispbuilder-sdl)
(defun ex-draw-stroke ()
  (let ((x-prev-pos 0)
        (y-prev-pos 0))
    (sdl:with-init ()
      (let ((width 500)
            (height 500))
        (sdl:window width height
                    :title-caption "Lpaste-stroke")
        (sdl:clear-display (sdl:color))
        (setf (sdl:frame-rate) 60)
        (sdl:with-events ()
          (:quit-event () t)
          (:video-expose-event ()
                               (sdl:update-display))
          (:key-down-event ()
                           (when (or (sdl:key-down-p :sdl-key-q)
                                     (sdl:key-down-p :sdl-key-escape))
                             (sdl:push-quit-event)))
          (:mouse-motion-event (:x x :y y)
                               (sdl:draw-filled-circle-*
                                x y (sdl-base::clamp
                                     (+ (abs (- x x-prev-pos))
                                        (abs (- y y-prev-pos)))
                                     0 255)
                                :color sdl:*red*
                                :stroke-color sdl:*white*)
                               (setf x-prev-pos x
                                     y-prev-pos y))
          (:idle ()
                 (sdl:update-display)))))))
(ex-draw-stroke)

