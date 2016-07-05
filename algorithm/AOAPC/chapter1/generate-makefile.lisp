(with-open-file (*standard-output*
                 "makefile"
                 :direction :output
                 :if-exists :supersede)
  (dotimes (i 13)
    (format t "1-~d: 1-~d.c~%"
            (1+ i) (1+ i))
    (princ #\tab)
    (format t "gcc -Wall 1-~d.c -o 1-~d~%"
            (1+ i)
            (1+ i))))
