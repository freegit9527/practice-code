(defparameter *t* (read))

(dotimes (i *t*)
  (let* ((str (read-line))
         (half-len (floor
                    (/ (length str)
                       2))))
    (do ((i 0 (+ i 2)))
        ((>= i half-len)
         (format t "~%"))
      (format t "~a" (aref str i)))))
