;;;; dtnl.lisp

(in-package #:dtnl)

;;; "dtnl" goes here. Hacks and glory await!

(defparameter *width* 640)
(defparameter *height* 480)

(defresource "touch.wav" :volume 20)

(defun dtnl ()
  (setf *screen-height* *height*)
  (setf *screen-width* *width*)
  (setf *resizable* t)
  (setf *scale-output-to-window* t)
  (with-session
    (open-project :dtnl)
    (index-pending-resources)
    (play-sample "touch.wav")))
