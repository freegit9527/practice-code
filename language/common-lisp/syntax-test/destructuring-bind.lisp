(defun iota (n)
  (loop for i from 1 to n collect i))

(destructuring-bind ((a &optional (b 'bee))
                     one two three)
    `((alpha fee) ,@(iota 3))
  (list a b three two one))
