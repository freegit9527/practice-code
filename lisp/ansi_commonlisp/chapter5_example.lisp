;;;; Chapter 5 Control

;;; 5.1 Blocks

(block head
  (format t "Here we go.")
  (return-from head 'idea)
  (format t "We'll never see this."))

(defun foo ()
  (return-from foo 27))

(defun read-integer (str)
  (let ((accum 0))
    (dotimes)))
