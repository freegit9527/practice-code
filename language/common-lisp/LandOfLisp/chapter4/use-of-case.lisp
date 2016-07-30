(defvar *arch-enemy* nil)

(defun pudding-eater (person)
  (cond ((eq person 'henry)
         (setf *arch-enemy* 'stupid-lisp-alien)
         '(curse you lisp alien - you ate my pudding))
        ((eq person 'johnny)
         (setf *arch-enemy* 'useless-old-johnny)
         '(i hope you choked on my pudding johnny))
        (t '(why you eat my pudding stranger ?))))

(defun case/pudding-eater (person)
  (case person
    ((henry)
     (setf *arch-enemy* 'stupid-lisp-alien)
     '(curse you lisp alien - you ate my pudding))
    ((johnny)
     (setf *arch-enemy* 'useless-old-johnny)
     '(i hope you choked on my pudding johnny))
    (otherwise
     '(why you eat my pudding stranger ?))))
