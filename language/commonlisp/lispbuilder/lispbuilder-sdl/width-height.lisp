;;;;; Converted from the "Width and Height" Processing example at:
;;;;; "http://www.processing.org/learning/examples/widthheight.html"
;;;;; (C)2006 Luke J Crook
(ql:quickload :lispbuilder-sdl)
(ql:quickload :lispbuilder-sdl-examples)
(in-package #:sdl-examples)

(defun width-height ()
  (let ((width 500) (height 500))
    (sdl:with-init ()
      (sdl:window width height :title-caption "Width and Height, from Processing.org")
      (setf (sdl:frame-rate) 5)
      (sdl:clear-display (sdl:color :r 127 :g 127 :b 127))

      (loop for i from 0 to height by 20
	 do (progn (sdl:draw-box (sdl:rectangle :x 0 :y i :w width :h 10)
				  :color (sdl:color))
		   (sdl:draw-box (sdl:rectangle :x i :y 0 :w 10 :h height)
				  :color (sdl:color :r 255 :g 255 :b 255))))
      (sdl:update-display)
      (sdl:with-events ()
	(:quit-event () t)
        (:key-down-event ()
                         (when (or (sdl:key-down-p :sdl-key-q)
                                   (sdl:key-down-p :sdl-key-escape))
                           (sdl:push-quit-event)))
	(:video-expose-event () (sdl:update-display))))))

(width-height)
