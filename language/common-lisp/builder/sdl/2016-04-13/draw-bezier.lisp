(ql:quickload :lispbuilder-sdl)
(defun ex-draw-bezier-line ()
  (sdl:with-init ()
    (let ((width 500)
          (height 500)
          (j 20))
      (sdl:window width height :title-caption "Lpaste")
      (sdl:clear-display (sdl:color) :update t)
      (sdl:with-events ()
        (:quit-event () t)
        (:video-expose-event ()
                             (sdl:update-display))
        (:key-down-event ()
                         (when (or (sdl:key-down-p :sdl-key-q)
                                   (sdl:key-down-p :sdl-key-escape))
                           (sdl:push-quit-event)))
        (:idle ()
               (sdl:clear-display (sdl:color))
               (incf j 5)
               (when (> j 480)
                 (setf j 20))
               (sdl:with-color (col (sdl:color :r 255 :g 200 :b 0))
                 (loop for i from 0 to 200 by 20
                    do
                      (sdl:draw-bezier (list (sdl:point :x 60 :y (random (+ i j)))
                                             (sdl:point :x (+ j i) :y 410)
                                             (sdl:point :x (+ j 170) :y i)
                                             (sdl:point :x (random j) :y (random (+ i 20))))
                                       :style :solid))
                 (sdl:update-display)))))))
(ex-draw-bezier-line)
