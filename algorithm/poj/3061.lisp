(defvar *N*)
(defvar *S*)
(defvar *a*)
(defvar n)

(defun print-array ()
  (loop for i from 0 to (1- (length *a*)) do
    (format t "~d " (elt *a* i)))
  (format t "~%"))

(defun solve ()
  (let ((sum 0)
        (i 0)
        (j 0)
        (ans (+ 1 *N*)))
    (block while
      (loop
        (do ()
            ((or (>= sum *S*)
                 (>= j *N*)))
          (incf sum (aref *a* j))
          (incf j))
        (if (< sum *S*)
            (return-from while))
        (setf ans (min ans (- j i)))
        (decf sum (aref *a* i))
        (incf i)))
    (if (equal ans (1+ n))
        (setf ans 0))
    (format t "~d~%" ans)))

(with-open-file (*standard-input*
                 "3061.txt"
                 :if-does-not-exist nil)
  (setf n (read))
  (dotimes (i n)
    (setf *N* (read))
    (setf *S* (read))
    (setf *a* (make-array *N*
                                  :element-type 'integer
                                  :fill-pointer 0
                                  :adjustable t))
    (dotimes (j *N*)
      (vector-push-extend (read) *a*))
    (solve)))
