(ql:quickload :lispbuilder-sdl)
(in-package :lispbuilder-sdl)
(sdl:with-init
    ()
  (sdl:window
   512
   512
   :title-caption "Lpaste"
   :icon-caption "liu xue yang")
  (sdl:draw-surface-at-*
   (sdl:load-image
    "./new-face.png") 100 150)
  (sdl:update-display)
  (sdl:with-events
      ()
    (:quit-event () t)
    (:key-down-event ()
                     (sdl:push-quit-event))
    (:video-expose-event ()
                         (sdl:update-display))))

(with-init
    ()
                                        ; initialise sdl and the video subsystem
  (window
   512
   512
   :title-caption "Lpaste"
   :icon-caption "liu xue yang")
                                        ; open a window, 320 x 240
  (setf (frame-rate) 30)
                                        ; lock the frame rate to 30 fps
  (sdl:draw-surface
   (sdl:load-image
    "./new-face.png"))
  (with-events
      ()
    (:quit-event () t)
                                        ; absolutely have to handle the :quit-event,
                                        ; or the application will not exit.
    (:key-down-event ()
                     (when (key-down-p :sdl-key-escape)
                       (push-quit-event)))
    (:mouse-motion-event (:x mouse-x :y mouse-y)
                         (clear-display *black*)
                         ;; draw the box with center at the mouse x/y coordinates.
                         (draw-box-*
                          (- mouse-x (/ 20 2))
                          (- mouse-y (/ 20 2))
                          20
                          20
                          :color *yellow*))
    (:idle () (update-display))))

(defparameter *random-color* sdl:*white*)
(defparameter *current-shape* 'rectangle)
(defun set-random-color-shape (shape)
  (setf
   *random-color*
   (sdl:color
    :r (random 255)
    :g (random 255)
    :b (random 255))
   *current-shape*
   shape))
(defun display-shape ()
  (cond ((sdl:mouse-left-p)
         (set-random-color-shape 'rectangle))
        ((sdl:mouse-right-p)
         (set-random-color-shape 'circle)))
  (sdl:clear-display sdl:*white*)
  (sdl:draw-surface-at-*
              (sdl:load-image
               "./new-face.png")
              (- (sdl:mouse-x) 150)
              (- (sdl:mouse-y) 70))
  (cond ((equal *current-shape*
                'rectangle)
         (sdl:draw-box
          (sdl:rectangle-from-midpoint-*
           (sdl:mouse-x)
           (sdl:mouse-y)
           20
           20)
          :color *random-color*))
        ((equal *current-shape* 'circle)
         (sdl:draw-filled-circle-*
          (sdl:mouse-x)
          (sdl:mouse-y)
          5
          :color *random-color*))))
(defun mouse-react-2d ()
  (sdl:with-init
      ()
    (sdl:window
     512
     512
     :title-caption "Lpaste"
     :resizable t
     ;; :no-frame t
     )
    (setf (sdl:frame-rate) 60)
    (sdl:with-events
        ()
      (:quit-event () t)
      (:key-down-event ()
                       (sdl:push-quit-event))
      (:idle ()
             (display-shape)
             ;; Redraw the display
             (sdl:update-display)))))

(mouse-react-2d)
