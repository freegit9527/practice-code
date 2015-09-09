(defparameter *fn*
  (let ((count 0))
    #'(lambda ()
	(setf count (1+ count)))))

(defparameter *count*
  (let ((count 0))
    (list
     #'(lambda () (incf count))
     #'(lambda () (decf count))
     #'(lambda () count))))

(defvar *x* 10)

(defun foo ()
  (format t "X: ~d~%" *x*))

(let ((*x* 20))
  (foo))

(defun bar ()
  (foo)
  (let ((*x* 200)) (foo))
  (foo))


(defun foo ()
  (format t "Before assignment~18tX: ~d~%" *x*)
  (setf *x* (1+ *x*))
  (format t "After assignment~18tX: ~d~%~%" *x*))

