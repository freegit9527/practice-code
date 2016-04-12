(ql:quickload :lispbuilder-sdl)

(defun draw-line-on-window ()
  (sdl:with-init ()
    (sdl:window 300 300)
    (let ((step 15)
          (y (/ 300 2)))
      (sdl:with-events ()
        (:quit-event () t)
        (:key-down-event ()
                         (when (or (sdl:key-down-p :sdl-key-q)
                                   (sdl:key-down-p :sdl-key-escape))
                           (sdl:push-quit-event)))
        (:idle ()
               (sdl:clear-display (sdl:color))
               (decf y step)
               (when (< y 0)
                 (setf y 300))
               (sdl:draw-hline (- (/ 300 2) 40)
                               (+ (/ 300 2) 40)
                               y
                               :color (sdl:color :r 100
                                                 :b 150
                                                 :g 250))
               (sdl:update-display))))))

(draw-line-on-window)
;; nice :-)
