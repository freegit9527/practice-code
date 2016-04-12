(ql:quickload :lispbuilder-sdl)
(defparameter
    *line-color*
  (sdl:color
   :r 100
   :b 150
   :g 250))
(defparameter *start-pos* (/ 300 2))
(defun draw-two-primary-line ()
  (sdl:draw-hline
   0
   300
   (floor (/ 300 2))
   :color *line-color*)
  (sdl:draw-vline
   (floor (/ 300 2))
   0
   300
   :color *line-color*))
(defun draw-line-on-window ()
  (sdl:with-init ()
    (sdl:window 500 500)
    (let ((v-up-step 3)
          (v-down-step 3)
          (h-left-step 3)
          (h-right-step 3)
          (y-up (- *start-pos* 10))
          (y-down (+ *start-pos* 10))
          (x-left (- *start-pos* 10))
          (x-right (+ *start-pos* 10)))
      (sdl:with-events ()
        (:quit-event () t)
        (:key-down-event ()
                         (when (or (sdl:key-down-p :sdl-key-q)
                                   (sdl:key-down-p :sdl-key-escape))
                           (sdl:push-quit-event)))
        (:idle ()
               (sdl:clear-display (sdl:color))
               (decf y-up v-up-step)
               (incf y-down v-down-step)
               (decf x-left h-left-step)
               (incf x-right h-right-step)
               (cond ((< y-up 0)
                      (setf ;; y-up (- *start-pos* 10)
                       v-up-step -1))
                     ((> y-up (- *start-pos* 10))
                      (setf ;; y-up (- *start-pos* 10)
                       v-up-step 1)))
               (cond ((>= y-down 300)
                      (setf ;; y-down (+ *start-pos* 10)
                       v-down-step -1))
                     ((< y-down (+ *start-pos* 10))
                      (setf ;; y-down (+ *start-pos* 10)
                       v-down-step 1)))
               (cond ((< x-left 0)
                      (setf ;; x-left (- *start-pos* 10)
                       h-left-step -1))
                     ((> x-left (- *start-pos* 10))
                      (setf ;; x-left (- *start-pos* 10)
                       h-left-step 1)))
               (cond ((>= x-right 300)
                      (setf ;; x-right (+ *start-pos* 10)
                       h-right-step -1))
                     ((< x-right (+ *start-pos* 10))
                      (setf ;; x-right (+ *start-pos* 10)
                       h-right-step 1)))
               (draw-two-primary-line)
               ;; up line
               (sdl:draw-hline x-left x-right y-up :color *line-color*)
               ;; down line
               (sdl:draw-hline x-left x-right y-down :color *line-color*)
               ;; left line
               (sdl:draw-vline x-left y-up y-down :color *line-color*)
               ;; right line
               (sdl:draw-vline x-right y-up y-down :color *line-color*)
               (sdl:update-display))))))


(draw-line-on-window)
;; nice :-)
