(ql:quickload :lispbuilder-sdl)
(defun draw-with-mouse ()
  (sdl:with-init
      ()
    (let ((width 500)
          (height 500))
      (sdl:window width height)
      (sdl:clear-display (sdl:color :r 255 :b 255 :g 255)
                         :update t)
      (sdl:with-events
          ()
        (:quit-event () t)
        (:video-expose-event ()
                             (sdl:update-display))
        (:key-down-event ()
                         (cond ((or (sdl:key-pressed-p :sdl-key-q)
                                    (sdl:key-pressed-p
                                     :sdl-key-escape))
                                (sdl:push-quit-event))
                               ((or (sdl:key-pressed-p
                                     :sdl-key-space)
                                    (sdl:key-pressed-p :sdl-key-c))
                                (sdl:clear-display
                                 (sdl:color :r 255 :b 255 :g 255))
                                (sdl:update-display))))
        (:mouse-motion-event (:x x :y y :x-rel xrel :y-rel yrel)
                             (when (sdl:mouse-left-p)
                               (sdl:draw-line-*
                                x
                                y
                                (- x xrel)
                                (- y yrel)
                                :color (sdl:color :r 255 :b 0 :g 0))
                               (sdl:update-display)))))))
(draw-with-mouse)
