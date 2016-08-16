(with-open-file
    (*standard-input* "input.txt")
  (let ((t-case (read)))
    (dotimes (i t-case)
      (let ((a (read))
            (b (read)))
        (format *standard-output* "~d~%" (+ a b))))))
