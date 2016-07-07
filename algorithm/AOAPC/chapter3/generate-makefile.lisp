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

(defun append-makefile (problem-number language)
  (with-open-file (*standard-output*
                   "makefile"
                   :direction :output
                   :if-exists :append)
    (if (equal language "++")
        (format t "uva-~a++: uva-~a.cpp~%"
                problem-number
                problem-number)
        (format t "uva-~a: uva-~a.c~%"
                problem-number
                problem-number))
    (princ #\tab)
    (if (equal language "++")
        (format t "g~a -Wall -DDEBUG uva-~a.cpp -o uva-~a++~%"
                language problem-number problem-number)
        (format t "g~a -Wall -DDEBUG uva-~a.c -o uva-~a~%"
                language problem-number problem-number))))
