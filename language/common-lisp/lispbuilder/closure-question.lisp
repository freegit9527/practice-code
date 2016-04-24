(defparameter control-list
  (let ((count 0))
    (list #'(lambda ()
              (incf count))
          #'(lambda ()
              (decf count))
          #'(lambda ()
              count)
          #'(lambda ()
              (setf count 0)))))

(defun increase-2 ()
  (dotimes (i 2)
    (funcall (first control-list)))
  (funcall (third control-list)))

(increase-2)
(format t "~d~&" (funcall (third control-list)))
(format t "after increase: ~d~&" (funcall (first control-list)))
(format t "show value: ~d~&" (funcall (third control-list)))

(dotimes (i 4)
  (format t "inc 1: ~d ~&" (funcall (first control-list))))

(defun foo1 ()
  (let ((var1 1))
    (let ((var2 100))
      (foo2)
      (format t "after foo2, var2 is: ~d~&" var2))))

(defun foo2 ()
  (format t "var2 is ~d~&" var2)
  (decf var2))

