;;;; dtnl.lisp

;; based on plong game: https://gitlab.com/dto/plong

;; just a demo.

(in-package #:dtnl)

;;; "dtnl" goes here. Hacks and glory await!

;; configure global variables

(defparameter *width* 640)
(defparameter *height* 480)
(defparameter *unit* 16)
(defparameter *bird-image* "bird.png")
(defparameter *bird-fly-image* "bird-fly.png")
(defun units (n) (* *unit* n))
(defparameter *brick-width* (units 2))
(defparameter *brick-height* (units 1))
(defparameter *bird-reload-frames* 30)

;; configure resources

(defresource "touch.wav" :volume 20)
(defresource "bip.wav" :volume 20)

;; ;-)

(defclass paddle (node)
  ((direction :initform nil)
   (height :initform (units 15))
   (widht :initform (units 3))
   (color :initform "red")))

(defclass ball (node)
  ((height :initform (units 1))
   (widht :initform (units 1))
   (color :initform "white")
   (speed :initform 7)
   (heading :initform (direction-heading :down))
   (image :initform *bird-image*)
   (fly-clock :initform 0 :accessor fly-clock)))

(defclass wall (node)
  ((color :initform "gray50")))

(defun make-wall (x y width height)
  (let ((wall (make-instance 'wall)))
    (resize wall width height)
    (move-to wall x y)
    wall))

(defclass brick (node)
  ((color :initform "gray60")
   (height :initform *brick-height*)
   (width :initform *brick-width*)
   (heading :initform (direction-heading :left))
   (speed :initform 2)))

(defmethod initialize-instance :after ((brick brick)
                                       &key color)
  (when color
    (setf (slot-value brick 'color)
          color)))

(defparameter *row-colors*
  '("dark orchid"
    "medium orchid"
    "orchid"
    "dark orange"
    "orange"
    "gold"))

(defun row-color (row)
  (nth (mod row (length *row-colors*))
       *row-colors*))

(defun make-puzzle ()
  (with-new-buffer
    (dotimes (column 30)
      (let ((cur-row (random 27)))
        (dotimes (row cur-row)
          (add-node (current-buffer)
                    (make-instance 'brick :color
                                   (row-color column))
                    (+ (* 120 column)
                       (* column *brick-width*)
                       200)
                    (* row *brick-height*)))
        (do ((row (+ 5 cur-row) (1+ row)))
            ((>= row 30))
          (add-node (current-buffer)
                    (make-instance 'brick :color
                                   (row-color column))
                    (+ (* 120 column)
                       (* column *brick-width*)
                       200)
                    (* row *brick-height*)))))))

;; (defun ball (slot-value (current-buffer) 'ball))

(defun holding-up-arrow ()
  (keyboard-down-p :up))

(defun holding-down-arrow ()
  (keyboard-down-p :down))

(defun holding-escape ()
  (keyboard-down-p :escape))

(defun holding-shift-up ()
  (and (keyboard-down-p :lshift)
       (keyboard-down-p :up)))

(defun find-direction ()
  (cond ((holding-up-arrow) :up)
        ((holding-down-arrow) :down)
        ((holding-escape) (quit))))

(defmethod update ((ball ball))
  (with-slots (heading speed fly-clock) ball
    (when (plusp fly-clock)
      (decf fly-clock))
    (let ((head (find-direction)))
      (if head
          (speed-up ball head)
          (setf heading (direction-heading :down))))
    (move ball heading speed)))

(defmethod speed-up ((ball ball)
                     head)
  (with-slots (heading speed image jump-clock) ball
    (setf heading (direction-heading head))
    ;; (setf image *bird-fly-image*)
    (incf speed 25)
    (change-image ball *bird-fly-image*)
    (setf jump-clock *bird-reload-frames*)
    ;; (incf speed 1)
    ))

(defmethod speed-up :after ((ball ball)
                            head)
  (with-slots (speed image) ball
    (setf speed 7)
    (change-image ball *bird-image*)
    ;; (setf image *bird-image*)
    ;; (setf speed 1)
    ))

(defmethod update ((brick brick))
  (with-slots (heading speed) brick
    (move brick heading speed)))

(defmethod collide :after ((ball ball)
                           (node node))
  (play-sample "bip.wav"))

;; XELF:INSERT is called on one object to insert it
;; into the (CURRENT-BUFFER)

;; XELF:PASTE copies all the objects from a buffer into
;; this current buffer

(defclass universe (buffer)
  ((background-color :initform "white")
   (width :initform *width*)
   (height :initform *height*)
   (paddle :initform (make-instance 'paddle))
   (ball :initform (make-instance 'ball))))

(defmethod start-game ((universe universe))
  (with-slots (ball paddle) universe
    (with-buffer universe
      (insert ball)
      ;; (insert paddle)
      (move-to ball 40 0)
      ;; (move-to paddle 110 0)
      (paste universe (make-puzzle)))))

(defun dtnl ()
  (setf *screen-height* *height*)
  (setf *screen-width* *width*)
  (setf *resizable* t)
  (setf *scale-output-to-window* t)
  (with-session
    (open-project :dtnl)
    ;; INDEX-ALL-IMAGES doesn't really INDEX them...
    ;; instead it adds them to a list.
    ;; but INDEX-PENDING-RESOURCES finally indexes
    (index-all-images)
    (index-pending-resources)
    (play-sample "touch.wav")
    (format t "liuxueyang-bug, path: ~S" xelf:*project-path*)
    (let ((universe (make-instance 'universe)))
      (switch-to-buffer universe)
      (start-game universe))))
