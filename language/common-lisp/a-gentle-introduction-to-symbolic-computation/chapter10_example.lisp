;;; ##############################
;;;                              #
;;;     chapter 10 Assignment    #
;;;          Example Code        #
;;;                              #
;;; ##############################


;; ==============================
;; ==============================

;; 10.3 STEREOTYPICAL UPDATING METHODS
(setf a 2)
(incf a 10)
(decf a)

(setf mystack nil)
(push 'dish1 mystack)
(push 'dish2 mystack)
(push 'dish3 mystack)

(pop mystack)

(setf *friends* nil)

(defun meet (person)
  (cond ((equal person (first *friends*))
	 'we-just-met)
	((member person *friends*)
	 'we-know-each-other)
	(t (push person *friends*)
	   'pleased-to-meet-you)))

(meet 'fred)
(meet 'cindy)
(meet 'cindy)
(meet 'joe)
(meet 'fred)
*friends*


;; ==============================
;; ==============================

;; 10.4 WHEN AND UNLESS

(defun picky-multiply (x y)
  "Computes x times y.
Input x must be odd; y must be even."
  (unless (oddp x)
    (incf x)
    (format t
	    "~&Changing x to ~S to make it odd." x))
  (when (oddp y)
    (decf y)
    (format t
	    "~&Changing y to ~S to make it even." y))
  (* x y))

(picky-multiply 4 6)
(picky-multiply 2 9)


;; ==============================
;; ==============================

;; 10.6 CASE STUDY: A TIC-TAC-TOE PLAYER

(defun make-board ()
  (list 'board 
	0 0 0
	0 0 0
	0 0 0))

(defun convert-to-letter (v)
  (cond ((equal v 1) "O")
	((equal v 10) "X")
	(t " ")))

(defun print-row (x y z)
  (format t "~&    ~A | ~A | ~A "
	  (convert-to-letter x)
	  (convert-to-letter y)
	  (convert-to-letter z)))

(defun print-board (board)
  (format t "~%")
  (print-row
   (nth 1 board) (nth 2 board) (nth 3 board))
  (format t "~&   -----------")
  
  (print-row
   (nth 4 board) (nth 5 board) (nth 6 board))
  (format t "~&   -----------")
  
  (print-row
   (nth 7 board) (nth 8 board) (nth 9 board))
;  (format t "~&   -----------")

  (format t "~%~%"))

(setf b (make-board))

(print-board b)

(defun make-move (player pos board)
  (setf (nth pos board) player)
  board)

(setf *computer* 10)

(setf *opponent* 1)

(make-move *opponent* 3 b)

(make-move *computer* 5 b)

(print-board b)

(setf *triplets*
      '((1 2 3) (4 5 6) (7 8 9)
	(1 4 7) (2 5 8) (3 6 9)
	(1 5 9) (3 5 7)))

(defun sum-triplet (board triplet)
  (+ (nth (first triplet) board)
     (nth (second triplet) board)
     (nth (third triplet) board)))

(sum-triplet b '(3 5 7))

(sum-triplet b '(2 5 8))

(sum-triplet b '(7 8 9))

(defun compute-sums (board)
  (mapcar #'(lambda (x)
	      (sum-triplet board x))
	  *triplets*))

(compute-sums b)

(defun winner-p (board)
  (let ((sum (compute-sums board)))
    (or (member (* 3 *computer*) sum)
	(member (* 3 *opponent*) sum))))

(defun board-full-p (board)
  (not (member 0 board)))

(defun read-a-legal-move (board)
  (format t "~&Your move: ")
  (let ((pos (read)))
    (cond ((not (and (<= 1 pos 9)
		     (integerp pos)))
	   (format t "~&Invalid input.")
	   (read-a-legal-move board))
	  ((not (zerop (nth pos board)))
	   (format t
		   "~&That space is already occupied.")
	   (read-a-legal-move board))
	  (t pos))))

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
	   (format t "~&I win!"))
	  ((board-full-p new-board)
	   (format t "~&Tie game."))
	  (t (opponent-move new-board)))))

(defun play-one-game ()
  (if (y-or-n-p "Would you like to go first?")
      (opponent-move (make-board))
      (computer-move (make-board))))


(defun find-empty-position (board squares)
  (find-if #'(lambda (x) (zerop (nth x board)))
	squares))

(defun win-or-block (board target-sum)
  (let ((triplet
	 (find-if #'(lambda (x) (equal (sum-triplet board x)
				       target-sum))
		  *triplets*)))
    (when triplet
      (find-empty-position board triplet))))

(defun make-three-in-a-row (board)
  (let ((pos (win-or-block board (* 2 *computer*))))
    (and pos (list pos "make three in a row"))))

(defun block-opponent-win (board)
  (let ((pos (win-or-block board (* 2 *opponent*))))
    (and pos (list pos "block opponent"))))


;; ==============================
;; ==============================

;; Lisp Toolkit: BREAK and ERROR
(defun analyze-profit (price commission-rate)
  (let* ((commission (* price commission-rate))
	 (result
	  (cond ((> commission 100) 'rich)
		((< commission 100) 'poor))))
;    (break "Value of RESULT is ~S" result)
    (format t "~&I predict you will be: ~S" result)
    result))

(analyze-profit 1600 0.15)

(analyze-profit 3100 0.02)

(analyze-profit 2000 0.05)


;; ==============================
;; ==============================

;; 10.8 DESTRUCTIVE OPERATIONS ON LISTS

(setf x '(a b c))
(setf y '(d e f))
(append x y)
x
(nconc x y)
x
y
(setf x nil)
(setf y '(no luck today))
(nconc x y)
x

(setf x '(a))
(nconc x '(b c) '(d e) '(f) nil)
x

(setf tree '(i say (e i (e i) o)))
(nsubst 'a 'e tree)
tree
(nsubst 'cherry '(a i) tree :test #'equal)
tree

(setf x '(a b c d a e f a a a))
(remove 'a x)
x
(delete 'a x)
x

;; ==============================
;; ==============================

;; 10.10 SETQ AND SET

(setf duck 'donald)

(defun test1 (duck)
  (list duck
	(symbol-value 'duck)))

(test1 'huey) ; output (huey donald)

(defun test2 (duck)
  (set 'duck 'daffy)
  (list duck
	(symbol-value 'duck)))

(test2 'huey) ; output (huey daffy)
