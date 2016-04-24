;;;;; Converted from the "Setup and Draw" Processing example at:
;;;;; "http://www.processing.org/learning/examples/setupdraw.html"
;;;;; (C)2006 Luke J Crook
(ql:quickload :lispbuilder-sdl)
(ql:quickload :lispbuilder-sdl-examples)

(in-package #:sdl-examples)

(defun setup-and-draw ()
  (let ((width 500) (height 500)
	(y 10))
    (sdl:with-init ()
      (sdl:window width height :title-caption "Setup and Draw, from Processing.org")
      (setf (sdl:frame-rate) 30)
      (sdl:with-events ()
	(:quit-event () t)
        (:key-down-event ()
                         (when (or (sdl:key-down-p :sdl-key-q)
                                   (sdl:key-down-p :sdl-key-escape))
                           (sdl:push-quit-event)))
	(:idle ()
               (sdl:clear-display (sdl:color :r 150 :g 100 :b 200))
               (decf y 1)
               (when (< y 0)
                 (setf y height))
               (sdl:draw-hline 0 (floor (/ width 2)) y
                               :clipping nil
                               :color (sdl:color :r 255 :g 255 :b 255))
               (sdl:draw-hline (floor (/ width 2)) width (+ y 10)
                               :clipping nil
                               :color (sdl:color :r 255 :g 255 :b 255))
               (sdl:update-display))))))

(defun setup-and-draw-vline ()
  (let ((width 500) (height 500)
	(x 10))
    (sdl:with-init ()
      (sdl:window width height :title-caption "Setup and Draw, from Processing.org")
      (setf (sdl:frame-rate) 30)
      (sdl:with-events ()
	(:quit-event () t)
        (:key-down-event ()
                         (when (or (sdl:key-down-p :sdl-key-q)
                                   (sdl:key-down-p :sdl-key-escape))
                           (sdl:push-quit-event)))
	(:idle ()
               (sdl:clear-display (sdl:color :r 150 :g 100 :b 200))
               (decf x 1)
               (when (< x 0)
                 (setf x width))
               (sdl:draw-vline x (- height 40) height
                               :clipping nil
                               :color (sdl:color :r 255 :g 255 :b 255))
               (sdl:update-display))))))

(setup-and-draw)
(setup-and-draw-vline)
