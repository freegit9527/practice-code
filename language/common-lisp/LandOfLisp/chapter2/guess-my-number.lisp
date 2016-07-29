;; my version guess-my-number
;; 2016.07.29

(defun liu/guess-my-number ()
  (let* ((low 1)
         (high 100)
         (guess-number
           (floor (/ (+ low high) 2))))
    (format t "~d~%" guess-number)
    (block do
      (do ((input (read-line) (read-line)))
          ((or (equal input "quit")
               (equal input "q")))
        (cond ((equal input "bigger")
               (setf high guess-number))
              ((equal input "smaller")
               (setf low guess-number))
              ((equal input "yes")
               (format t "I am so smart:D~%")
               (return-from do)))
        (setf guess-number (floor (/ (+ high low)
                                     2)))
        (format t "~d~%" guess-number)))))

;; guess-my-number on Land Of LISP
(defparameter *small* 1)
(defparameter *big* 100)
(defun guess-my-number ()
  (ash (+ *small* *big*)
       -1))

(defun smaller ()
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number))

;; on the book, this is inverse...

(defun bigger ()
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))

(defun start-over ()
  (defparameter *small* 1)
  (defparameter *big* 100))
