(defvar *t*)

(setf *t* (read))

(dotimes (tt *t*)
  (let ((l (read))
        (c (read)))
    (dotimes (il l)
      (dotimes (ic c)
        (if (or (equal ic 0)
                (equal il 0)
                (equal ic (1- c))
                (equal il (1- l)))
            (format t "*")
            (format t ".")))
      (format t "~%")))
  (unless (equal tt (1- *t*))
    (format t "~%")))
