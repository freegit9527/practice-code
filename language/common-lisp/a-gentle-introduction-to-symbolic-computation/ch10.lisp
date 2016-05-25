;10.3

(setf *friends* nil)
(setf *met-once-more* 0)
(defun meet (person)
  (cond ((equal person (first *friends*))
	 (incf *met-once-more*)
	 'we-just-met)
	((member person *friends*)
	 (incf *met-once-more*)
	 'we-know-each-other)
	(t (push person *friends*)
	   'pleased-to-meet-you)))



;10.4
(defun forget (person)
  (cond ((equal person (first *friends*))
	 (pop *friends*))
	(t 'not-in-first-place)))

; example in 10.4
(defun picky-multiply (x y)
  "Computes X times Y.
Input X must be odd; Y must be even."
  (unless (oddp x)
    (incf x)
    (format t "~&Changing X to ~S to make it odd." x))
  (when (oddp y)
    (decf y)
    (format t "~&Changing Y to ~S to make it even." y))
  (* x y))

; example in 10.6
(defun convert-to-letter (v)
  (cond ((equal v 1) "O")
	((equal v 10) "X")
	(t " ")))

(defun print-row (x y z)
  (format t "~&   ~A | ~A | ~A"
	  (convert-to-letter x)
	  (convert-to-letter y)
	  (convert-to-letter z)))

(defun print-board (board)
  (format t "~%")
  (print-row
   (nth 1 board) (nth 2 board) (nth 3 board))
  (format t "~&  -----------")
  (print-row
   (nth 4 board) (nth 5 board) (nth 6 board))
  (format t "~&  -----------")
  (print-row
   (nth 7 board) (nth 8 board) (nth 9 board))
  (format t "~%~%"))

(defun make-board ()
  (list 'board 0 0 0 0 0 0 0 0 0))

(setf b (make-board))

(defun make-move (player pos board)
  (setf (nth pos board) player)
  board)

(setf *computer* 10)

(setf *opponent* 1)

(make-move *opponent* 3 b)

(make-move *computer* 5 b)

(setf *triplets*
      '((1 2 3) (4 5 6) (7 8 9)
	(1 4 7) (2 5 8) (3 6 9)
	(1 5 9) (3 5 7)))

(defun sum-triplet (board triplet)
  (+ (nth (first triplet) board)
     (nth (second triplet) board)
     (nth (third triplet) board)))

(defun compute-sums (board)
  (mapcar #'(lambda (triplet)
	      (sum-triplet board triplet))
	  *triplets*))

(defun winner-p (board)
  (let ((sums (compute-sums board)))
    (or (member (* 3 *computer*) sums)
	(member (* 3 *opponent*) sums))))

(defun read-a-legal-move (board)
  (format t "~&Your move: ")
  (let ((pos (read)))
    (cond ((not (and (integerp pos)
		     (<= 1 pos 9)))
	   (format t "~&Invalid input.")
	   (read-a-legal-move))
	  ((not (zerop (nth pos board)))
	   (format t "~&That space is already occupied."))
	  (t pos))))

(defun board-full-p (board)
  (not (member 0 board)))

(defun opponent-move (board)
  (let* ((pos (read-a-legal-move board))
	 (new-board (make-move *opponent* pos board)))
    (print-board new-board)
    (cond ((winner-p new-board)
	   (format t "~&You win!"))
	  ((board-full-p new-board)
	   (format t "~&Tie game."))
	  (t (computer-move new-board)))))

(defun pick-random-empty-position (board)
  (let ((pos (1+ (random 9))))
    (if (zerop (nth pos board))
	pos
	(pick-random-empty-position board))))

(defun random-move-strategy (board)
  (list (pick-random-empty-position board)
	"random move"))

(defun choose-best-move (board)
  (or (make-three-in-a-row board)
      (block-opponent-win board)
      (random-move-strategy board)))

(defun computer-move (board)
  (let* ((best-move (choose-best-move board))
	 (pos (first best-move))
	 (strategy (second best-move))
	 (new-board (make-move *computer* pos board)))
    (format t "~&My move: ~S" pos)
    (format t "~&My strategy: ~A~%" strategy)
    (print-board new-board)
    (cond ((winner-p new-board)
	   (format t "~&Computer win!"))
	  ((board-full-p new-board)
	   (format t "~&Tie game."))
	  (t (opponent-move new-board)))))

(defun play-one-game ()
  (if (y-or-n-p "Would you like to go first? ")
      (opponent-move (make-board))
      (computer-move (make-board))))

(defun find-empty-position (board squares)
  (find-if #'(lambda (pos)
	       (zerop (nth pos board)))
	   squares))

(defun win-or-block (board target-sum)
  (let ((triplet (find-if
		  #'(lambda (trip)
		      (equal target-sum
			     (sum-triplet board trip)))
		  *triplets*)))
    (when triplet
      (find-empty-position board triplet))))

(defun block-opponent-win (board)
  (let ((pos (win-or-block board
			   (* 2 *opponent*))))
    (and pos (list pos "block opponent"))))

(defun make-three-in-a-row (board)
  (let ((pos (win-or-block board
			   (* 2 *computer*))))
    (and pos (list pos "make three in a row"))))

; 10.5

(defun ugly (x y)
  (let* ((bigger (if (> x y)
		    x y))
	(avg (/ (+ x y) 2.0))
	(pct (* 100 (/ avg bigger))))
    (list 'average avg 'is pct
	  'percent 'of 'max y)))

; lisp toolkit: break and error

(defun analyze-profit (price commission-rate)
  (let* ((commission (* price commission-rate))
	 (result
	  (cond ((> commission 100) 'rich)
		((< commission 100) 'poor))))
    (break "Value of result is ~S" result)
    (format t "~&I predict you will be: ~S" result)))
	 
;; keyboard exercise

; 10.8

; a. problem
(setf *corners* '(1 3 7 9))

(setf *sides* '(2 4 6 8))

; b. problem
; I will not write this problem now...

;;; 2015/01/24 20:38
;;; This is some exercise in the book...

; 10.9
(defun chop (lst)
  (setf lst (list (first lst))))


; 10.10

(defun ntack (lst x)
  (nconc lst (list x)))

; 10.11
(setf x '(a b c))
; It will cause ERROR!
;(setf (cdr (last x)) x)
;(format t "~&x = ~S" x)


; 10.12
(setf h '(hi ho))

; It will cause ERROR
;(conc h h)

;; 10.10 setq and set.. example

(setf duck 'donald)
(defun test1 (duck)
  (list duck
	(symbol-value 'duck)))
