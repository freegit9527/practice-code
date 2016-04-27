;;;; dtnl.lisp

(in-package #:dtnl)

;;; "dtnl" goes here. Hacks and glory await!

;; configure global variables

(defparameter *width* 640)
(defparameter *height* 480)
(defparameter *unit* 16)
(defun units (n) (* *unit* n))
(defparameter *brick-width* (units 2))
(defparameter *brick-height* (units 1))

;; configure resources

(defresource "touch.wav" :volume 20)

;; ;-)

(defclass paddle (node)
  ((direction :initform nil)
   (height :initform (units 15))
   (widht :initform (units 3))
   (color :initform "red")))

(defclass ball (node)
  ((height :initform (units 1))
   (widht :initform (units 1))
   (color :initform "black")
   (speed :initform 5)
   (heading :initform (direction-heading :down))))

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
   (width :initform *brick-width*)))

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
    (dotimes (column 6)
      (let ((cur-row (random 30)))
        (dotimes (row cur-row)
          (add-node (current-buffer)
                    (make-instance 'brick :color
                                   (row-color column))
                    (+ (* 50 column)
                       (* column *brick-width*)
                       80)
                    (* row *brick-height*)))
        (do ((row (+ 3 cur-row) (1+ row)))
            ((>= row 30))
            (add-node (current-buffer)
                      (make-instance 'brick :color
                                     (row-color column))
                      (+ (* 50 column)
                         (* column *brick-width*)
                         80)
                      (* row *brick-height*)))))))

;; (defun ball (slot-value (current-buffer) 'ball))

(defun holding-up-arrow ()
  (keyboard-down-p :up))

(defun holding-down-arrow ()
  (keyboard-down-p :down))

(defun holding-escape ()
  (keyboard-down-p :escape))

(defun find-direction ()
  (cond ((holding-up-arrow) :up)
        ((holding-down-arrow) :down)
        ((holding-escape) (quit))))

(defmethod update ((ball ball))
  (with-slots (heading speed) ball
    (let ((head (find-direction)))
      (if head
          (setf heading (direction-heading (find-direction)))
          (setf heading (direction-heading :down))))
    ;; (format t "~&direction: ~S" direction)
    (move ball heading speed)))

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
      (move-to ball 80 0)
      ;; (move-to paddle 110 0)
      (paste universe (make-puzzle)))))

(defun dtnl ()
  (setf *screen-height* *height*)
  (setf *screen-width* *width*)
  (setf *resizable* t)
  (setf *scale-output-to-window* t)
  (with-session
      (open-project :dtnl)
    (index-pending-resources)
    (play-sample "touch.wav")
    (let ((universe (make-instance 'universe)))
      (switch-to-buffer universe)
      (start-game universe))))

(dtnl)
