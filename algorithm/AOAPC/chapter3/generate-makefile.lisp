(defun generate-makefile ()
  (with-open-file (*standard-output*
                   "makefile"
                   :direction :output
                   :if-exists :supersede)
    (dotimes (i 13)
      (format t "3-~d: 3-~d.c~%"
              (1+ i) (1+ i))
      (princ #\tab)
      (format t "gcc -Wall -DDEBUG 3-~d.c -o 3-~d~%"
              (1+ i)
              (1+ i)))))

(defun append-makefile (problem-number)
  (with-open-file (*standard-output*
                   "makefile"
                   :direction :output
                   :if-exists :append)
    (format t "uva-~d: uva-~d.c~%"
            problem-number
            problem-number)
    (princ #\tab)
    (format t "gcc -Wall -DDEBUG uva-~d.c -o uva-~d~%"
            problem-number problem-number)))
