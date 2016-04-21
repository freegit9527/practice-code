;; 9.10

(defun space-over (n)
  (cond ((eq n 0) t)
	(t (format t " ")
	   (space-over (1- n)))))

(defun test (n)
  (format t "~%>>>")
  (space-over n)
  (format t "<<<"))

(defun plot-one-point (plotting-string y-val)
  (space-over y-val)
  (format t "~A~&" plotting-string))

(defun plot-points (str lst)
  (mapcar #'(lambda (x) (plot-one-point str x)) lst))

(defun generate (m n)
  (cond ((equal m n) (list m))
	(t (cons m (generate (1+ m) n)))))


(defun square (n)
  (* n n))

(defun prompt (lst)
  (format t "Function to graph?")
  (let ((fun (read)))
    (format t "We get ~A~%" (mapcar fun lst))))

(defun prompt-fun ()
  (let ((fun (read)))
    (plot-points "*-" (generate (funcall fun -7)
			       (funcall fun 7)))))

(defun make-graph ()
  (format t "~&Function to graph? ")
  (let ((fun (read)))
    (format t "Starting x value? ")
    (let ((x (read)))
      (format t "Ending x value? ")
      (let ((end-x (read)))
	(format t "Plotting string? ")
	(let ((str (read)))
	  (plot-points str
		       (mapcar fun (generate x end-x))) )))))



;; 9.8 example..

(setf glee-club
      '((john smith) (barbara wilson) (mustapha ali)))

(defun print-one-name (name)
  (format t "~&~10S ~S"
	  (second name)
	  (first name)))

(defun print-all-names (x)
  (mapcar #'print-one-name x)
  'done)

(defun sevenths (x)
  (mapcar #'(lambda (numerator)
	      (format t "~&~4,2F / 7 is ~7,5F"
		      numerator
		      (/ numerator 7.0)))
	  x))


(defun read-all-objects (stream eof-indicator)
  (let ((result (read stream nil eof-indicator)))
    (if (eq result eof-indicator)
	nil
	(cons result (read-all-objects stream eof-indicator)))))

(defun read-my-file ()
  (with-open-file (my-steam "in.txt")
    (let ((content (read-all-objects my-steam (list '$eof$))))
      (format t "~&Read ~S objects from the file."
	      (length content))
	      content)))
; 9.11
(defun dot-print1 (lst)
  (cond
    ((null lst) (format t "~S" lst))
    ((symbolp lst) (format t "~S" lst))
    ((listp (first lst))
     (format t "(")
     (dot-print1 (first lst))
     (format t " . ")
     (dot-print1 (rest lst))
     (format t ")"))
    (t (format t "(~S . " (first lst))
       (dot-print1 (rest lst))
       (format t ")"))))

; 9.15
(defun hybrid-prin1 (lst)
  (format t "(")
  (cond
    ((null (rest lst))
     (format t "~S)" (first lst)))
    ((listp (rest lst))
     (format t "~S " (first lst))
     (print-cdr (rest lst)))
    (t (format t ". ~S)" (rest lst)))))

(defun print-cdr (lst)
  (cond
    ((null (rest lst))
     (format t "~S)" (first lst)))
    ((listp (rest lst))
     (format t "~S " (first lst))
     (print-cdr (rest lst)))
    (t (format t ". ~S)" (rest lst)))))


