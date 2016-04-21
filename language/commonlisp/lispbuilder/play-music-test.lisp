(ql:quickload '(:lispbuilder-sdl-mixer :lispbuilder-sdl))
(defparameter *root-path* #P"/home/aries/Hack/language/commonlisp/lispbuilder/")
(defun initialize-my-parameters (music cover width height)
  (defparameter *window-width* width)
  (defparameter *window-height* height)
  (defparameter *music* (sdl:create-path *root-path* music))
  (defparameter *cover* (sdl:create-path *root-path* cover)))
(initialize-my-parameters "sample.wav" "yinlin.png" 500 500)
(initialize-my-parameters "xiaoyaoxing.ogg" "xuwei.jpeg" 500 500)
(initialize-my-parameters "april.ogg" "xuwei.jpeg" 500 500)

(defun box-image ()
  (sdl:draw-box
   (sdl:rectangle :x (floor (/ *window-width* 3))
                  :y (floor (/ *window-height* 3))
                  :w (floor (/ *window-width* 3))
                  :h (floor (/ *window-height* 3)))
   :color (sdl:color :r 200 :g 200 :b 200))
  (sdl:draw-surface-at-*
   (sdl:load-image *cover*
                   :alpha 90)
   (- (/ *window-width* 2) (floor (/ 145 2)))
   (- (/ *window-height* 2) (/ 220 2))))

(defparameter *playing-status*
  (let ((playing-p 1))
    (list #'(lambda ()
              (if (equal 1 playing-p) (decf playing-p)))
          #'(lambda ()
              (if (zerop playing-p) (incf playing-p)))
          #'(lambda () playing-p))))

(defun control-music ()
  (cond (
         ;; pause music
         (or (sdl:mouse-left-p)
             (sdl:key-pressed-p :sdl-key-c)
             (and (sdl:key-pressed-p :sdl-key-space)
                  (equal (funcall (third *playing-status*))
                         1)))
         (sdl-mixer:pause-music)
         (funcall (first *playing-status*)))
        ;; resume music
        ((or (sdl:mouse-right-p)
             (sdl:key-pressed-p :sdl-key-r)
             (and (sdl:key-pressed-p :sdl-key-space)
                  (zerop (funcall (third *playing-status*)))))
         (sdl-mixer:resume-music)
         (funcall (second *playing-status*)))))

(defun draw-moving-line (x)
  (sdl:draw-vline x (- (floor (/ *window-height* 2)) 70)
                  (+ (floor (/ *window-height* 2)) 70)
                  :clipping nil
                  :color sdl:*red*))
(sdl:with-init (sdl:sdl-init-video sdl:sdl-init-audio)
  (sdl:window *window-width* *window-height*)
  (sdl-mixer:OPEN-AUDIO)
  (let ((music
         (sdl-mixer:load-music
          *music*))
        (x *window-width*)
        (step 1))
    (sdl-mixer:play-music music :loop t)
    (sdl:with-events ()
      (:quit-event ()
                   (sdl-mixer:Halt-Music)
                   (sdl-mixer:free music)
                   (sdl-mixer:close-audio)
                   t)
      (:key-down-event ()
                       (when (or (sdl:key-down-p :sdl-key-q)
                                 (sdl:key-down-p :sdl-key-escape))
                         (sdl:push-quit-event)))
      (:idle ()
             (sdl:clear-display (sdl:color :r 127 :g 127 :b 127))
             (box-image)
             (control-music)
             (if (zerop (funcall (third *playing-status*)))
                 (progn (setf step 0))
                 (setf step 1))
             (decf x step)
             (when (< x 0)
               (setf x *window-width*))
             (draw-moving-line x)
             (sdl:update-display)))))
