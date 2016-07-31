;; 2016.07.30 23:22:41 PM
;; Sabastian
;; building a text adventure game engine

;; ====================
;; location

(defparameter *nodes*
  '((living-room (you are in the living-room.
                  a wizard is snoring loudly on the couch.))
    (garden (you are in a beautiful garden.
             there is a well in front of you.))
    (attic (you are in the attic.
            there is a giant welding torch in the corner.))))

(defun describe-location (location nodes)
  "location is a symbol.
nodes is the global variable."
  (cadr (assoc location nodes)))

;; ====================
;; edges

(defparameter *edges*
  '((living-room
     (garden west door)
     (attic upstairs ladder))
    (garden
     (living-room east door))
    (attic
     (living-room downstairs ladder))))

(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

(defun describe-paths (location edges)
  "location is a symbol.
edges is the global variable"
  (apply #'append
         (mapcar #'describe-path
                 (cdr (assoc location edges)))))

;; ====================
;; objects

(defparameter *objects* '(whiskey bucket frog chain))
(defparameter *object-locations* '((whiskey living-room)
                                   (bucket living-room)
                                   (chain garden)
                                   (frog garden)))


;; One Way to write OBJECTS-AT function

;; (defun object-at-location-p (object location object-locations)
;;   "object and location are symbols.
;; object-locations is a global variable"
;;   (eq (cadr (assoc object object-locations))
;;       location))

;; if the test function in REMOVE-IF-NOT require more than one
;; arguments, then use a lambda to wrap the function. ;-)

;; (defun objects-at (location objects object-locations)
;;   (remove-if-not #'(lambda (object)
;;                      (object-at-location-p object
;;                                            location
;;                                            object-locations))
;;                  objects))

;; A better way for OBJECTS-AT function
(defun objects-at (location objects object-locations)
  "location is a symbol.
objects and object-locations are global variables.
return a list of objects in the current location."
  (labels ((at-location-p (object)
             (eq location
                 (cadr (assoc object object-locations)))))
    (remove-if-not #'at-location-p objects)))

(defun describe-objects (location objects object-locations)
  "location is a symbol.
objects and object-locations are global variables."
  (apply #'append
         (mapcar #'(lambda (object)
                     `(you see a ,object on the floor.))
                 (objects-at location objects
                             object-locations))))

;; ====================
;; Describing it ALL

(defparameter *location* 'living-room)

(defun look ()
  (append (describe-location *location* *nodes*)
          (describe-paths *location* *edges*)
          (describe-objects *location* *objects*
                            *object-locations*)))

;; Walking Around in Our World
(defun walk (direction)
  (let ((next
          (find direction
                (cdr (assoc *location* *edges*))
                :key #'cadr)))
    (cond (next
           (setf *location* (car next))
           (look))
          (t
           '(you cannot go that way.)))))

;; ====================
;; Pick Up Objects

(defun pickup (object)
  "object is a symbol.
push a new list to *object-locations*, return a message list"
  (cond ((member
          object
          (objects-at *location* *objects*
                      *object-locations*))
         (push `(,object body) *object-locations*)
         `(you are now carrying the ,object))
        (t '(you cannot get that.))))

;; ====================
;; Checking Our Inventory

(defun inventory ()
  (cons 'items- (objects-at 'body *objects* *object-locations*)))
