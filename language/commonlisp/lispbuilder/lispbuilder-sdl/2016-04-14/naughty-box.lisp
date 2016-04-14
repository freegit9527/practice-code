(ql:quickload :lispbuilder-sdl)
(defparameter *line-color*
  (sdl:color :r 100
             :b 150
             :g 250))
(defun draw-primary-line (width height)
  (sdl:draw-hline 0 width (floor
                           (/ width 2))
                  :color *line-color*)
  (sdl:draw-vline (floor (/ height 2))
                  0 width
                  :color *line-color*))
(defun naughty-box ()
  (sdl:with-init ()
      (let* ((width 500)
             (height 500)
             (step 1)
             (backup-step)
             (index (floor (/ width 3)))
             (len (floor (/ width 3))))
        (sdl:window width height)
        (sdl:clear-display (sdl:color))
        (sdl:with-events ()
          (:quit-event () t)
          (:key-down-event ()
                           (cond ((or (sdl:key-pressed-p
                                       :sdl-key-q)
                                      (sdl:key-pressed-p
                                       :sdl-key-escape))
                                  (sdl:push-quit-event))
                                 ((sdl:key-pressed-p
                                   :sdl-key-c)
                                  (if (or (equal step 1)
                                          (equal step -1))
                                      (setf backup-step step))
                                  (setf step 0))
                                 ((sdl:key-pressed-p
                                   :sdl-key-r)
                                  (if (zerop step)
                                          (setf step backup-step))
                                  (format t "step is: ~d~&" step))))
          (:video-expose-event ()
                               (sdl:update-display))
          (:idle ()
                 (sdl:clear-display (sdl:color))
                 (draw-primary-line width height)
                 (incf index step)
                 (decf len (* 2 step))
                 (when (< len 3)
                   (setf step -1
                         len 3))
                 (when (> len 498)
                   (setf step 1
                         len 498))
                 (sdl:draw-box
                  (sdl:rectangle
                   :x index
                   :y index
                   :w len
                   :h len)
                  :color *line-color*)
                 (sdl:update-display))))))
(naughty-box)
