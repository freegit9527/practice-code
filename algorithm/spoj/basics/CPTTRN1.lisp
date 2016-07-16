(defparameter *t*
  (read))

(dotimes (i *t*)
  (let ((l (read))
        (c (read)))
    (dotimes (il l)
      (dotimes (ic c)
        (if (evenp (+ il ic))
            (format t "*")
            (format t ".")))
      (format t "~%")))
  (unless (equal i (1- *t*))
    (format t "~%")))
