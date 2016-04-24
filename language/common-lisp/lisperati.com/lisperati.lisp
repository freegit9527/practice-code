;; this is a text adventure game 

(defvar *objects* '(whiskey-bottle bucket frog chain))


(defvar *map* '(
              (living-room
               (you are in the living-room of a
                wizards house. there is a wizard snoring
                loudly on the couch.)
               (west door garden)  
               (upstairs stairway attic))
              (garden (you are in a beautiful garden.
                       there is a well in front of you.)
               (east door living-room))
              (attic (you are in the attic of the wizards
                      house. there is a giant welding
                      torch in the corner.)
               (downstairs stairway living-room))))


(defvar *object-locations* '((whiskey-bottle living-room)
                           (bucket living-room)
                           (chain garden)
                           (frog garden)))


(defvar *location* 'living-room)

(defun is-at (obj loc obj-loc)
  (eq loc (second (assoc obj obj-loc))))

(defun describe-location (location map)
  (second (assoc location map)))

(defun describe-path (path)
  `(there is a ,(second path) going ,(first path) from here.))

(defun describe-paths (location map)
  (apply #'append (mapcar #'describe-path (cddr (assoc location map)))))

(defun describe-floor (loc objs obj-loc)
  (apply #'append (mapcar (lambda (x)
                            `(you see a ,x on the floor.))
                          (remove-if-not (lambda (x)
                                           (is-at x loc obj-loc))
                                         objs))))

(defun look ()
  (append (describe-location *location* *map*)
          (describe-paths *location* *map*)
          (describe-floor *location* *objects* *object-locations*)))

(defun walk-direction (direction)
  (let ((next (assoc direction (cddr (assoc *location* *map*)))))
    (cond (next (setf *location* (third next))
                (look))
          (t '(you can't go that way.)))))

(defmacro walk (direction)
  `(walk-direction ',direction))

(defun pickup-object (object)
  (cond ((is-at object *location* *object-locations*)
         (push (list object 'body) *object-locations*)
         `(you are now carrying the ,object))
        (t '(you cannot get that.))))

(defmacro pickup (object)
  `(pickup-object ',object))

(defun inventory ()
  (remove-if-not (lambda (x)
                   (is-at x 'body *object-locations*))
                 *objects*))

(defun have-object (object)
  (member object (inventory)))

(defmacro have (object)
  `(have-object ',object))

(defvar *chain-welded* nil)

(defun weld-subject-object (subject object)
  (cond ((and (eq *location* 'attic)
              (eq subject 'chain)
              (eq object 'bucket)
              (have chain)
              (have bucket)
              (not *chain-welded*))
         (setf *chain-welded* t)
         '(the chain is now securely welded to the bucket.))
        (t '(you cannot weld like that.))))

(defmacro weld (subject object)
  `(weld-subject-object ',subject ',object))

(defvar *bucket-filled* nil)

(defun dunk-subject-object (subject object)
  (cond ((and (eq *location* 'garden)
              (eq subject 'bucket)
              (eq object 'well)
              (have 'bucket)
              *chain-welded*)
         (setf *bucket-filled* t)
         '(the bucket is now full of water))
        (t '(you cannot dunk like that.))))

(defmacro dunk (subject object)
  `(dunk-subject-object ',subject ',object))

(defmacro game-action (command subj obj place &rest rest)
  `(defmacro ,command (subject )))
