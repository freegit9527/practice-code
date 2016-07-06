(with-open-file (*standard-output*
                 "makefile"
                 :direction :output
                 :if-exists :supersede)
  (dotimes (i 13)
    (format t "2-~d: 2-~d.c~%"
            (1+ i) (1+ i))
    (princ #\tab)
    (format t "gcc -Wall 2-~d.c -o 2-~d~%"
            (1+ i)
            (1+ i))))
