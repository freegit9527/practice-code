(with-open-file
    (*standard-input*
     "input.txt")
  (loop for a = (read *standard-input* nil nil)
        and b = (read *standard-input* nil nil)
        until (null a)
        do (format t "~d~%" (loop for i from a to b sum (* i i)))))
