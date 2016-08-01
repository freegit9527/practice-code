(load "text-adventure-game")

(defun game-read ()
  (let ((cmd
          (read-from-string
           (concatenate 'string "(" (read-line) ")"))))
    (cons (car cmd)
          (mapcar #'(lambda (x)
                      `',x)
                  (cdr cmd)))))

(defun tweak-text (lst capital-p literal-p)
  (let ((item (car lst))
        (rest (rest lst)))
    (if item
        (cond ((member item '(#\! #\? #\.))
               (cons item (tweak-text rest t nil)))
              ((eq item #\")
               (cons item (tweak-text rest nil (not literal-p))))
              (literal-p
               (cons item (tweak-text rest nil literal-p)))
              (capital-p
               (cons (char-upcase item)
                     (if (alpha-char-p item)
                         (tweak-text rest nil literal-p)
                         (tweak-text rest t literal-p))))
              (t
               (cons (char-downcase item)
                     (tweak-text rest nil literal-p)))))))

(defun game-print (lst)
  (princ
   (coerce
    (tweak-text
     (coerce (string-trim "() "
                          (prin1-to-string lst))
             'list)
     t nil)
    'string))
  (fresh-line))

(defparameter *allowed-commands* '(look walk pickup inventory))

(defun game-eval (sexp)
  (if (member (first sexp)
              *allowed-commands*)
      (eval sexp)
      '(i do not know that command.)))

(defun game-repl ()
  (let ((cmd (game-read)))
    (unless (eq (car cmd)
                'quit)
      (game-print (game-eval cmd))
      (game-repl))))

#||
Play this text adventure game:

CL-USER> (game-repl)
look
You are in the living-room. A wizard is snoring loudly on the couch. There is
 a door going west from here. There is a ladder going upstairs from here. You
 see a whiskey on the floor. You see a bucket on the floor.
pickup whiskey
You are now carrying the whiskey
pickup bucket
You are now carrying the bucket
inventory
Items- whiskey bucket
go upstairs
I do not know that command.
walk upstairs
You are in the attic. There is a giant welding torch in the corner. There is a
 ladder going downstairs from here.
walk downstairs
You are in the living-room. A wizard is snoring loudly on the couch. There is
 a door going west from here. There is a ladder going upstairs from here.
walk west
You are in a beautiful garden. There is a well in front of you. There is a
 door going east from here. You see a frog on the floor. You see a chain on the
 floor.
pickup frog
You are now carrying the frog
pickup chain
You are now carrying the chain
inventory
Items- whiskey bucket frog chain
look
You are in a beautiful garden. There is a well in front of you. There is a
 door going east from here.
quit
NIL
CL-USER> 
||#
