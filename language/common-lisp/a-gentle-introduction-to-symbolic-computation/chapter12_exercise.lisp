;;; ##############################
;;;                              #
;;;     chapter 12 Structures    #
;;;      and The Type System     #
;;;          Exercise Code       #
;;;                              #
;;; ##############################



;; ==============================
;; ==============================

;; EXERCISES

; 12.2
; (starship-p 'starship) returns nil

; 12.3
(type-of 'make-starship) ; returns symbol
(format t "~S" (type-of #'make-starship) ) ; print function
(type-of (make-starship)) ; returns starship

;; Keyboard Exercise

; 12.4

; a.
(defstruct node 
  name
  question
  yes-case
  no-case)

; b.

(setf *node-list* nil)

(defun init ()
  (setf *node-list* nil))

; author code :
(defun init-author ()
  (setf *node-list* nil)
  'initialized)

; c.

(defun add-node (name question yes-case no-case)
  (let ((new-node
         (make-node :name name
                    :question question
                    :yes-case yes-case
                    :no-case no-case)))
    (push new-node *node-list*)
    (node-name new-node)))

; author code
(defun add-node-author (name question yes-case no-case)
  (push (make-node :name name
                   :question question 
                   :yes-case yes-case
                   :no-case no-case)
        *node-list*)
  name)

(add-node 'battery-voltage-ok
          "Are the battery cables dirty or loose?"
          "Clean the cables and tighten the connection."
          'battery-cables-good)

; d.

(defun find-node (node-name-find)
  (dolist (item *node-list*)
    (if (equal (node-name item)
               node-name-find)
        (return item))))

; author code
(defun find-node-author (x)
  (find-if #'(lambda (item)
               (equal x (node-name item)))
           *node-list*))

; e.

(defun process-node (node-name-argu)
  (let  ((node-goal (find-node node-name-argu)))
    (if (null node-goal)
        (format t "I can not find the node.")
        (if (yes-or-no-p (node-question node-goal))
            (node-yes-case node-goal)
            (node-no-case node-goal)))))

(process-node 'battery-voltage-ok)


; f.

(defun run ()
       (let ((current-node 'start))
         (dolist (item *node-list*)
           (setf current-node (process-node (node-name item)))
           (if (stringp current-node)
               (progn (format t "~&~S" current-node)
                 (return))
               (if (null current-nodez)
                   (return))))))

; author code
(defun run-author ()
  (do ((current-node 'start (process-node (node-name current-node))))
      ((null current-node) nil)
    (cond 
     ((stringp current-node)
      (format t "~&~A" current-node)
      (return nil)))))

; g.

(defun add-node-interactive ()
  (let ((name)
        (question nil)
        (yes-case nil)
        (no-case nil)
        (new-node))
    (format t "~&Add a new node.~&Please input node name: ")
    (setf name (read))
    (format t "~&Input question: ") 
    (setf question (let ((str (read)))
                     (if (stringp str)
                         str
                         nil)))
    (if (null question)
        (return-from add-node "question must be a string..."))
    (format t "~&Input yes action: ")
    (setf yes-case (read))
    (format t "~&Input no action: ")
    (setf no-case (read))
    (setf new-node (make-node :name name
                              :question question
                              :yes-case yes-case
                              :no-case no-case))
    (push new-node *node-list*)))
    
(add-node)

; author version
(defun prompt-for (ask)
  (format t ask)
  (read))

(defun interactive-add-author ()
  (let* ((name (prompt-for "Node name? "))
         (quest (prompt-for "Question? "))
         (yes-action (prompt-for "If yes? "))
         (no-action (prompt-for "If no? ")))
    (add-node name quest yes-action no-action)))

