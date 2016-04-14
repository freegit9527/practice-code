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

(format t "~d" (funcall (first control-list)))
;; this value is not the same as the following

(funcall (third control-list))

(funcall (first control-list))
(funcall (second control-list))

(funcall (fourth control-list))

(format t "~S" (funcall (first control-list)))
(funcall (format t "~S" (second control-list)))
(funcall (format t "~S" (third control-list)))

(defparameter *fn*
  (let ((count 0))
    #'(lambda ()
        (setf count (1+ count)))))

(funcall *fn*)
(setf a 1)
(incf a)
