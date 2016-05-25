;; 11.1
(vector)
(vector 1)
(defvar a-vec (vector 1 2))
(defparameter *y*
  (make-array 5 :initial-element nil))
(defparameter *x*
  (make-array 5 :fill-pointer 0))

(vector-push 'a *x*)
(vector-push 'b *x*)
(vector-push 'c *x*)
(vector-pop *x*)

(defvar *z* (make-array 5 :fill-pointer 0
                        :adjustable t))

(vector-push-extend 1 *z*)
(vector-push-extend 2 *z*)
(vector-push-extend 3 *z*)

;; 11.2

(defvar *str* (make-array 5 :fill-pointer 0
                        :adjustable t
                        :element-type 'character))
(defvar *bit* (make-array 5 :fill-pointer 0
                        :adjustable t
                        :element-type 'bit))

(vector-push #\a *str*)

;; 11.3

(defparameter *vec*
  (vector 1 2 3))

(length *vec*)
(elt *vec* 0)
(elt *vec* 2)
;; (elt *vec* 3)

(setf (elt *vec* 0) 99)

;; 11.4

(count 1 #(1 2 1 2 3 1 2 3 4))
(remove 1 #(1 2 1 2 3 1 2 3 4))
(remove 1 '(1 2 1 2 3 1 2 3 4))
(remove #\a "foobarbaz")

(substitute 10 1 #(1 2 1 2 3 1 2 3 4))
(substitute 10 1 '(1 2 1 2 3 1 2 3 4))
(substitute #\x #\a "foobarbaz")
(find 1 #(1 2 1 2 3 1 2 3 4))
(find 10 #(1 2 1 2 3 1 2 3 4))
(position 1 #(1 2 1 2 3 1 2 3 4))

