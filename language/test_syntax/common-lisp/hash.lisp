(defparameter *h* (make-hash-table))

(setf (gethash 'foo *h*)
      233)
(defun show-value (key hash-table)
  (multiple-value-bind (value present) (gethash key hash-table)
    (if present
        (format t "Value ~a actually present.~%" value)
        (format t "Value ~a because key not found.~%" value))))

(setf (gethash 'bar *h*) nil)
(show-value 'foo *h*)
(show-value 'fooo *h*)
(show-value 'bar *h*)

(maphash #'(lambda (k v)
             (format t "~a => ~a~%" k v))
         *h*)

(remhash 'bar *h*)

(show-value 'bar *h*)

(clrhash *h*)
(show-value 'foo *h*)
