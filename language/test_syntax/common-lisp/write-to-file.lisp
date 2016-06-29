(with-open-file (*standard-output* "in.txt"
                                   :direction :output
                                   :if-exists :supersede)
  (dolist (item '(10 11 12 13))
    (prin1 item)
    (princ " ")))

;; PRINT prints an S-expression preceded by an end-of-line and
;; followed by a space.
;; PRIN1 prints just the S-expression.
;; PPRINT prints S-expression linke PRINT and PRIN1 but using the
;; "pretty printer"
(let ((in (open "in.txt"
                :if-does-not-exist nil)))
  (loop for i = (read in nil)
        while i
        do (print i)
           (format t "--> ")
           (princ (+ i 1))))

(let ((output (open "in1.txt"
                    :if-exists :append
                    :direction :output)))
  (write-line "hello Sabastian. ;-)" output)
  (close output))

(let ((input (open "in1.txt"
                   :if-does-not-exist nil
                   :direction :input)))
  (format t "~&~a~%" (read-line input))
  (close input))

;; this is simpler than previous
(with-open-file (stream
                 "in1.txt"
                 :if-does-not-exist nil
                 :direction :input)
  (format t "~&~a~%" (read-line stream)))

;; there is a simpler way to write file
(with-open-file (stream
                 "in2.txt"
                 :direction :output
                 :if-exists :supersede)
  (format stream "Some text."))

;; then read the file just now.
(with-open-file (stream
                 "in2.txt"
                 :if-does-not-exist nil)
  (format t "~&~a~%" (read-line stream)))
