(do ((prefix 0))
    ((>= prefix 5))
  (loop for i from 1 to 5
        do (when (evenp prefix)
             (incf prefix 2)
             (format t "prefix=~d~%" prefix))))
(format *standard-output* "Hello.world")
(with-open-file
    (*standard-input*
     "input4.txt")
  (with-open-file
      (*standard-output*
       "output4.txt"
       :direction :output)
    (loop for i = (read)
          do
             (format t "n=~d~%" i)
          until (zerop i))))
