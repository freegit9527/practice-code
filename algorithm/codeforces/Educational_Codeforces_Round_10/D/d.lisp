(defvar *n*)
(defparameter *maxn* 10)

(defclass node ()
  ((left :accessor left)
   (right :accessor right)
   (ori-position :accessor ori-position)))

(defparameter *s* (make-array *maxn* :element-type 'node
                                     :initial-element (make-instance 'node)))

(defun print-array ()
  (loop for i from 0 to (1- *n*) do
           (format t "i = ~d, ~d ~d~%"
                   i
                   (left (aref *s* i))
                   (right (aref *s* i)))))

;; (defun clean-array ()
;;   (loop for i from 0 to 
;;     (setf (left (aref *s* i)) 0)
;;     (setf (right (aref *s* i)) 0)
;;     (setf (ori-position (aref *s* i)) 0)))

(with-open-file
    (*standard-input*
     "in.txt")
  (setq *n* (read))
  (loop for i from 0 to (1- *n*) do
    (setf (left (aref *s* i)) (read))
    (setf (right (aref *s* i)) (read))
    (setf (ori-position (aref *s* i)) i)
    (format t "i = ~d, l = ~d, r = ~d~%"
            i
            (left (aref *s* i))
            (right (aref *s* i)))))

(print-array)

;; (dolist (item *s*)
;;   (format t "~d ~d" (left item)
;;           (right item)))

(format t "-------~%")

;; (loop for x being the element of *s*
;;       do
;;          (format t "~d ~d~%"
;;                  (left x)
;;                  (right x)))

;; (sort *s* #'< :key #'right)
