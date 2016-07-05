(let ((n (read)))
  (format t "~d~d~d~%"
          (mod n 10)
          (mod (floor (/ n 10)) 10)
          (floor (/ n 100))))
