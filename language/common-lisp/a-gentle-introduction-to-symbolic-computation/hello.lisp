(defun my-square ()
  (format t "Please type in a number: ")
  (let ((x (read)))
    (format t "The number ~S squared is ~S.~%" x (* x x))))


(defun riddle ()
  (if (yes-or-no-p "Do you seek Zen enlightment? ")
      (format t "Then do not ask for it!")
      (format t "You have found it.")))

(defun get-tree-data ()
  (with-open-file (stream "~/Videos/lisp/timber.dat")
    (let* ((tree-loc (read stream))
	   (tree-table (read stream))
	   (num-trees (read stream)))
      (format t "~&There are ~S trees on ~S."
	      num-trees tree-loc)
      (format t "~&They are: ~S" tree-table))))

(defun save-tree-data (tree-loc tree-table num-trees)
  (with-open-file (stream "~/Videos/lisp/timber.newdat"
			  :direction :output)
    (format stream "~S~%" tree-loc)
    (format stream "~S~%" tree-table)
    (format stream "~S~%" num-trees)))

(defun input ()
  (with-open-file (my-stream "in.txt")
    (let ((x (read my-stream))
	  (y (read my-stream)))
      (format t "x = ~S" x)
      (format t "~&y = ~S" y))))

(defun output ()
  (with-open-file (my-stream "in.txt")
    (let ((x (read my-stream))
	  (y (read my-stream)))
      (with-open-file (out-stream "out.txt"
				  :direction :output)
	(format out-stream "~&x = ~S" x)
	(format out-stream "~&y = ~S~%" y)))))
    
