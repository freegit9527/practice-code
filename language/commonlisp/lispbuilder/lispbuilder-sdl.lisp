(sdl:with-init
    ()
  (sdl:window
   512
   512
   :title-caption "Lpaste"
   :icon-caption "liu xue yang")
  (sdl:draw-surface
   (sdl:load-image
    "./new-face.png"))
  (sdl:update-display)
  (sdl:with-events
      ()
    (:quit-event () t)
    (:video-expose-event ()
                         (sdl:update-display))))

(with-init ()               ; initialise sdl and the video subsystem
  (window
   512
   512
   :title-caption "Lpaste"
   :icon-caption "liu xue yang")        ; open a window, 320 x 240
  
  (setf (frame-rate) 30)    ; lock the frame rate to 30 fps
  (sdl:draw-surface (sdl:load-image "~/Desktop/new-face.png"))
  (with-events ()
    (:quit-event () t)      ; absolutely have to handle the :quit-event,
                            ; or the application will not exit.
    (:key-down-event () 
      (when (key-down-p :sdl-key-escape) (push-quit-event)))

    (:mouse-motion-event (:x mouse-x :y mouse-y)
      (clear-display *black*)
      ;; draw the box with center at the mouse x/y coordinates.
      (draw-box-* (- mouse-x (/ 20 2)) (- mouse-y (/ 20 2)) 20 20 :color *yellow*))

    (:idle ()
           (update-display))))

(defparameter *random-color* sdl:*white*)
(defun mouse-react-2d ()
  (sdl:with-init ()
    (sdl:window 1024 1024 :title-caption "Lpaste")
    (setf (sdl:frame-rate) 60)
    (sdl:with-events ()
      (:quit-event () t)
      (:key-down-event ()
                       (sdl:push-quit-event))
      (:idle ()
             ;; change the color of the box if the left mouse
             ;; button is depressed
             (when (sdl:mouse-left-p)
               (setf *random-color* (sdl:color
                                     :r (random 255)
                                     :g (random 255)
                                     :b (random 255))))
             ;; Clear the display each game loop
             (sdl:clear-display sdl:*black*)
             (sdl:draw-box (sdl:rectangle-from-midpoint-*
                            (sdl:mouse-x) (sdl:mouse-y)
                            40 40)
                           :color *random-color*)
             (sdl:draw-surface-at-* (sdl:load-image "./new-face.png")
                                    (- (sdl:mouse-x) (/ 256 2))
                                    (+ 20 (sdl:mouse-y)))
             ;; Redraw the display
             (sdl:update-display)))))
(mouse-react-2d)
