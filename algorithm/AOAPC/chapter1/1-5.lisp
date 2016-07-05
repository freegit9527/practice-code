(let ((r (read))
      (h (read)))
  (format t "Area = ~,3f~%"
          (+ (* pi r r 2)
             (* pi r 2 h))))
