
;;; processing items in a list

;;; Problem 1: count the number of elements in a list
(defun count-list (lst)
  "count the number of elements in a list"
  (if (null lst)
      0
      (1+ (count-list (rest lst)))))

;;; Problem 2: reverse each string in a list of strings
(defun reverse-list (lst)
  "reverse each string in a list of strings"
  (let ((result nil))
    (dolist (ele lst)
      (setf result  (append result
			    (list (reverse ele)))))
    result))

;;; Problem 3: Find whether each number in a list is even or odd
(defun evenp-list (lst)
  "Find whether each number in a list is even or odd"
  (let ((result nil))
    (dolist (ele lst)
      (if (evenp ele)
	  (setf result  (cons t result))
	  (setf result  (cons nil result))))
    (reverse result)))

;;; Problem 4: Find the maximum element of a list
(defun max-list (lst)
  "Find the maximum element of a list"
  (let ((result (first lst)))
    (dolist (ele lst)
      (if (> ele result)
	  (setf result ele)))
    result))

;;; Problem 5: Duplicate each element in a list
(defun dupli  (lst)
  "Duplicate each element in a list"
  (let ((result nil))
    (dolist (ele lst)
      (setf result (append result (list ele ele))))
    result))

;;; Problem 6: Eliminate consecutive dupliates in a list
(defun compress (lst)
  "Eliminate consecutive dupliates in a list"
  (compress-helper (first lst) (rest lst) (list (first lst))))

(defun compress-helper (ele lst result)
  "helper recursive function for compress"
  (if (null lst)
      result
      (if (eql ele (first lst))
	  (compress-helper ele (rest lst) result)
	  (compress-helper (first lst) (rest lst)
			   (append result (list (first lst)))))))

(defun optimize-compress (lst)
  "optimize compress function"
  (if (null lst) nil
      (if (eq (first lst) (second lst))
	  (optimize-compress (rest lst))
	  (cons (first lst)
		(optimize-compress (rest lst))))))

