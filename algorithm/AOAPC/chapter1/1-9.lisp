(let ((a (read))
      (b (read)))
  (setf a (+ a b)
        b (- a b)
        a (- a b))
  (format t "~d ~d~%" a b))