;;;====================
;;; some example code
;;; in chapter 3
;;; Functional Programming
;;; 2015/02/27
;;;
;;; Time Passed. Now it is 2016/02/06. :(
;;;====================

;;; ====================
;;; 3.1 Function Design

(defun good-reverse (lst)
  (labels ((rec (lst acc)
             (if (null lst)
                 acc
                 (rec (cdr lst)
                      (cons (first lst) acc)))))
    (rec lst nil)))

(good-reverse '(a b c d e))

(= 2 (truncate 2.6)) ; return t. It uses first return value

(format t "~%~S"
	(multiple-value-bind (int frac)
	    (truncate 2.66)
	  (list int frac)))

(defun powers (x)
  (values x (sqrt x) (expt x 2)))

(format t "~%~S"
	(multiple-value-bind (base root square)
	    (powers 4)
	  (list base root square)))

;; ====================
;; 3.2 Imperative Outside-In

(defun fun (x)
  (list 'a (expt (car x) 2)))

(fun '(4))

(defun imp (x)
  (let (y sqr)
    (setq y (car x))
    (setq sqr (expt y 2))
    (list 'a sqr)))

(imp '(4))

;; ====================
;; 3.3 Functional Interfaces

(defun exclaim (expression)
  (append expression '(oh my)))

                                        ; type following three expressions in REPL

(nconc (exclaim '(lions and tigers and bears)) '(goodness))

;; (nconc * '(goodness))

(exclaim '(fixnums and bignums and floats))

                                        ; so we should write:

(defun exclaim (expression)
  (append expression (list 'oh 'my)))

(let ((a '(a b c)))
  (nconc a '(e f g))
  a)

;; 2016/02/13

(let ((x 0))
  (defun total (y)
    (incf x y)))

(total 3)

(defun not-ok (x)
  (nconc (list 'a) x (list 'c)))

(let ((a '(a b c)))
  (not-ok a)
  a)

;; use of mapcar, mapcan, maplist, mapc, mapl
;; refer to: https://psg.com/~dlamkins/sl/chapter12.html

;; mapc is like mapcar, map

;; mapcar
(mapcar #'car '((1 a)
                (2 b)
                (3 c)))
(mapcar #'abs '(3 -4 2 -5 -6))
(mapcar #'cons '(a b c) '(1 2 3))

;; maplist
(maplist #'append '(1 2 3 4)
         '(1 2)
         '(1 2 3))
(maplist #'(lambda (x)
             (cons 'foo x))
         '(a b c d))
(maplist #'(lambda (x)
             (if (member (car x) (cdr x))
                 0 1))
         '(a b a c d b c))

;; mapc
(setq dummy nil)
(mapc #'(lambda (&rest x)
          (setq dummy (append dummy x)))
      '(1 2 3 4)
      '(a b c d e)
      '(x y e))
(format t " ~S" dummy)
(setq dummy nil)
(mapcar #'(lambda (&rest x)
            (setq dummy (append dummy x)))
        '(1 2 3 4)
        '(a b c d e)
        '(x y e))
(format t " ~S" dummy)

;; mapcan
(mapcan #'(lambda (x y)
            (if (null x)
                nil
                (list x y)))
        '(nil nil nil d e)
        '(1 2 3 4 5 6))
(mapcar #'(lambda (x y)
            (if (null x)
                nil
                (list x y)))
        '(nil nil nil d e)
        '(1 2 3 4 5 6))
(mapcan #'(lambda (x)
            (and (numberp x)
                 (list x)))
        '(a 1 b c 3 4 d 5))

;; mapl
(setq dummy nil)
(mapl #'(lambda (x) (push x dummy))
      '(1 2 3 4))
(format t " dummy: ~S~%" dummy)
(setq dummy nil)
(maplist #'(lambda (x) (push x dummy))
         '(1 2 3 4))
(format t " dummy: ~S~%" dummy)

;; mapcon
(mapcon #'list '(1 2 3 4))

;; use of nconc
(nconc)
(setq x '(a b c))
(setq y '(d e f))
(nconc x y)
(format t " x = ~S~%" x)

(setq foo (list 'a 'b 'c 'd 'e)
      bar (list 'f 'g 'h 'i 'j)
      baz (list 'k 'l 'm))
(setq foo (nconc foo bar baz))
(format t " foo = ~S~%" foo)
(format t " bar = ~S~%" bar)
(format t " baz = ~S~%" baz)

(setq foo (list 'a 'b 'c 'd 'e)
      bar (list 'f 'g 'h 'i 'j)
      baz (list 'k 'l 'm))
(setq foo (nconc nil foo bar nil baz))
(format t " foo = ~S~%" foo)
(format t " bar = ~S~%" bar)
(format t " baz = ~S~%" baz)

;; use of rplaca, rplacd
(let ((a '(1 2 3)))
  (rplaca a 100)
  a)
(let ((a '(1 2 3)))
  (rplacd a (list 100))
  (format t "~%a is: ~S~%" a)
  (format t "rplacd return value: ~S~%" (rplacd (last a) (list 200)))
  (format t "~S~%" a)
  (setq lst (list* 'one 'two 'three 'four))
  (format t "~S~%" lst)
  (format t "rplaca return value: ~S~%" (rplaca lst 'uno))
  (format t "~S~%" lst)
  (format t "rplacd return value: ~S~%" (rplacd (last lst) (list 'IV)))
  (format t "~S~%" lst))

;; use of map
(map nil #'+
     (list 1 2 3)
     (list 4 5 6))

(map 'list #'+
     (list 1 2 3)
     (list 4 5 6))

(map 'vector #'+
     (list 1 2 3)
     (list 4 5 6))

(map '(vector number 3) #'+
     (list 1 2 3)
     (list 4 5 6))


;; 2016/02/14

;; make-sequence
(make-sequence 'list 0)
(make-sequence 'string 26 :initial-element #\.)
(make-sequence 'list 4 :initial-element 'x)
(make-sequence 'vector 4 :initial-element 'x)
(make-sequence 'vector 4 :initial-element #\a)
(make-sequence 'string 4 :initial-element #\a)
(setq ar1 (make-sequence '(vector double-float) 100 :initial-element 1d0))
(elt ar1 0)
(make-sequence 'vector 5 :initial-element 1)
(make-sequence '(vector * 5) 5 :initial-element 100)

;; vector
(vector)
(vector 1)
(vector 1 2)
(make-array 5 :initial-element nil)
(make-array 5 :fill-pointer 0)

(defparameter *x* (make-array 5 :fill-pointer 0))
(vector-push 'a *x*)
(format t "~%~S~%" *x*)
(vector-push 'b *x*)
(format t "~%~S~%" *x*)
(vector-push 'c *x*)
(format t "~%~S~%" *x*)
(vector-pop *x*)
(format t "~%~S~%" *x*)
(vector-pop *x*)
(format t "~%~S~%" *x*)
(vector-pop *x*)
(format t "~%~S~%" *x*)

(defparameter *y* (make-array 5 :fill-pointer 0 :adjustable t))
(vector-push-extend 'a *y*)
(format t "~%~S~%" *y*)
(vector-pop *y*)

(make-array 5 :fill-pointer 0 :adjustable t :element-type 'character)
(make-array 5 :fill-pointer 0 :adjustable t :element-type 'bit)

(defparameter *x* (vector 1 2 3))
(length *x*)
(elt *x* 0)
(elt *x* 1)
(elt *x* 2)
(elt *x* 3)
(setf (elt *x* 0) 10)
(elt *x* 0)

(count 1 #(1 2 1 2 3 1 2 3 4))
(remove 1 #(1 2 1 2 3 1 2 3 4))
(remove 1 '(1 2 1 2 3 1 2 3 4))
(remove #\a "foobarbaz")
(substitute 10 1 #(1 2 1 2 3 1 2 3 4))
(substitute 10 1 '(1 2 1 2 3 1 2 3 4))
(substitute #\c #\b "foobarbaz")
(find 1 #(1 2 1 2 3 1 2 3 4))
(find 10 #(1 2 1 2 3 1 2 3 4))
(position 1 #(1 2 1 2 3 1 2 3 4))

(count "foo" #("foo" "bar" "baz") :test #'string=)
(find 'c #((a 10) (b 20) (c 30) (d 40)) :key #'first)

(find 'c #((a 10) (b 20) (c 30) (d 40)) :key #'first :start 0 :end 2)

(find 'a #((a 10) (b 20) (c 30) (d 40)) :key #'first)
(find 'a #((a 10) ( 20) (a 30) (b 40)) :key #'first :from-end t)

(remove #\a "foobarbaz" :count 1)
(remove #\a "foobarbaz" :count 1 :from-end t)

(defparameter *v* #((a 10) (b 20) (a 30) (b 40)))
(defun verbose-first (x)
  (format t "~%Looking at ~s~%" x)
  (first x))
(count 'a *v* :key #'verbose-first)
(count 'a *v* :key #'verbose-first :from-end t)

(count-if #'evenp #(1 2 3 4 5))
(count-if-not #'evenp #(1 2 3 4 5))

(position-if #'digit-char-p "abcd0001")
(remove-if-not
 #'(lambda (x) (char= (elt x 0) #\f))
 #("foo" "bar" "baz" "foom"))

(count-if #'evenp #((1 a) (2 b) (3 c) (4 d) (5 e)) :key #'first)
(count-if-not #'evenp #((1 a) (2 b) (3 c) (4 d) (5 e)) :key #'first)
(remove-if-not #'alpha-char-p
               #("foo" "bar" "1baz") :key #'(lambda (x) (elt x 0)))

(remove-duplicates #(1 2 1 2 3 1 2 3 4))

(copy-seq '(1 2 3 4))
(reverse '(1 2 3 4))

(concatenate 'vector #(1 2 3) '(4 5 6))
(concatenate 'list #(1 2 3) '(4 5 6))
(concatenate 'string "abc" '(#\d #\e #\f))

(sort (vector "foo" "bar" "baz") #'string<)
(defparameter *my-vec* (vector 5 2 3 4 1))
(format t "~%~S" *my-vec*)
(sort *my-vec*  #'<)
(format t "~%~S" (elt *my-vec* 0))
(format t "~%~S" *my-vec*)

(merge 'vector #(5 3 1) #(6 2 4) #'<)
;; 并没有排序
(merge 'vector #(1 3 5) #(2 4 6) #'<)
(merge 'list #(1 3 5) #(2 4 6) #'<)

;; use of merge
(setq test1 (list 1 3 4 6 7))
(setq test2 (list 2 5 8))
(merge 'list test1 test2 #'<)

(setq test1 (copy-seq "OBY"))
;; 好像排序了？
(setq test2 (copy-seq "onsy"))
(merge 'string test1 test2 #'char-lessp)

(setq test1 "OBY")
(setq test2 "onsy")
(merge 'string test1 test2 #'char-lessp)

(setq test1 (vector '(red . 1) '(blue . 4)))
;; there is a bug in: http://clhs.lisp.se/Body/f_merge.htm
(setq test2 (vector '(yellow . 2) '(green . 7)))
;; 2016/02/14
(merge 'vector test1 test2 #'< :key #'cdr)

;; (merge '(vector * 4) '(1 5) '(2 4 6) #'<) should signal an error. :)
;; because specified vector length is shorter than result vector length.

(subseq "foobarbaz" 3)
(subseq "foobarbaz" 3 6)

(defparameter *x* (copy-seq "foobarbaz"))
(setf (subseq *x* 3 6) "xxx")
(format t "~%~S" *x*)

(setf (subseq *x* 3 6) "abcd")
(format t "~%~S" *x*)

(setf (subseq *x* 3 6) "xx")
(format t "~%~S" *x*)

(position #\b "foobarbaz")
(search "bar" "foobarbaz")

(mismatch "foobarbaz" "foom")

(mismatch "foobar" "bar" :from-end t)
(mismatch (vector 1 2 3 4 5) (vector 7 8) :from-end t)

(every #'evenp #(1 2 3 4 5))
(some #'evenp #(1 2 3 4 5))
(notany #'evenp #(1 2 3 4 5))
(notevery #'evenp #(1 2 3 4 5))

(every #'> #(1 2 3 4) #(5 4 3 2))
(some #'> #(1 2 3 4) #(5 4 3 2))
(notany #'> #(1 2 3 4) #(5 4 3 2))
(notevery #'> #(1 2 3 4) #(5 4 3 2))

(map 'vector #'* #(1 2 3 4 5) #(10 9 8 7 6))

(setq a '(1 2 3))
(setq b '(4 5 6))
(setq c '(7 8 9))
(map-into a #'+ a b c)
(format t "~%~S" a)

(let ((a (make-sequence 'list 3)))
  (print a)
  (map-into a #'+ (list 1 2 3) (list 4 5 6)))

(let ((a (make-sequence 'vector 3)))
  (print a)
  (map-into a #'+ (list 1 2 3) (list 4 5 6)))

(let ((a (make-sequence 'vector 3 :initial-element 0)))
  (print a)
  (map-into a #'+ (list 1 2 3) (list 4 5 6)))

(reduce #'+ #(1 2 3 4 5 6 7 8 9 10))

(reduce #'max #(5 8 1 2 3))

;; two strings with the same contents aren't necessarily EQL

(defparameter *h* (make-hash-table))
(gethash 'foo *h*)
(setf (gethash 'foo *h*) 'quux)
(gethash 'foo *h*)

(defun show-value (key hash-table)
  (multiple-value-bind (value present)
      (gethash key hash-table)
    (if present
        (format nil "Value ~a actually present." value)
        (format nil "Value ~a because key not found." value))))

(setf (gethash 'bar *h*) nil)

(show-value 'foo *h*)
(show-value 'bar *h*)
(show-value 'baz *h*)

(maphash #'(lambda (k v) (format t " ~a => ~a~%" k v)) *h*)
(maphash #'(lambda (k v) (when (and (numberp v) (< v 10))
                           (remhash k *h*))) *)

;; (make-sequence 'vector :initial-element 1)

(find 3 '((1 2) (3 4) (5 6)) :key 'car)

10
10/2
#xa

123
+123
-123
123.
2/3
-2/3
4/6
6/3
#b10101
#b1010/1011
#o777
#xdada
#36rabcdefghijklmnopqrstuvwxyz

1.0
1e0
1d0
123.0
123e0
0.123
.123
123e-3
123E-3
0.123e20
123d23

(setq c #c(2 1))
(setq c #c(2/3 3/4))
(setq c #c(2 1.0))
(setq c #c(2.0 1.0d0))
(setq c #c(3 0))
(setq c #c(3.0 0.0))
;; it is not the same with 0.0
(setq c #c(1/2 0))
(setq c #c(-6/3 0))

(+)
;; return 0
(*)
;; return 1

(+ 1 2)
(+ 1 2 3)
(+ 10.0 3.0)
(+ #c (1 2) #c (3 4))
(- 5 4)
(- 2)
(- 10 3 5)
(* 2 3)
(* 2 3 4)
(/ 10 5)
(/ 10 5 2)
(/ 2 3)
(/ 4)

(truncate -1 5)
;; truncate and ftruncate produce a quotient that has been truncated towards zero;
(multiple-value-bind (x y) (truncate -1 5)
  (format t "~%x = ~a" x)
  (format t "~%y = ~a" y))
(rem -1 5)

(floor -1 5)
;; floor and ffloor produce a quotient that has been truncated toward negative infinity;
(multiple-value-bind (x y) (floor -1 5)
  (format t "~%x = ~a" x)
  (format t "~%y = ~a" y))
(mod -1 5)

(let ((x -1)
      (y 5))
  (+
   (* (floor (/ x y)) y)
   (mod x y)))

(let ((x -1)
      (y 5))
  (+
   (* (truncate (/ x y)) y)
   (rem x y)))

(let ((x 10) (incf))
  (incf x 10)
  (print x)
  (decf x 10)
  (print x)
  (incf x)
  (print x)
  (decf x)
  (print x))

(= 1 1)
(= 10 20/2)
(= 1 1.0 #c (1.0 0.0) #c (1 0))

(/= 1 1)
(/= 1 2)
(/= 1 2 3)
(/= 1 2 3 1)
(/= 1 2 3 1.0)

(< 2 3)
(> 2 3)
(> 3 2)
(< 2 3 4)
(< 2 3 3)
(<= 2 3 3)
(<= 2 3 3 4)
(<= 2 3 4 3)

(max 10 11)
(min -12 -10)
(max -1 2 -3)

(zerop 0)
(minusp -1)
(plusp 1)

(evenp 2)
(oddp 3)

(format t " Hello, this is space _~c_:)" #\Space)
(format t " Hello, this is newline _~c_:)" #\Newline)

(string= "foobarbaz" "quuxbarfoo" :start1 3 :end1 6 :start2 4 :end2 7)
(string= "foobarbaz" "quuxbarfoo" :start1 3 :start2 4)
(string= "foobarbaz" "quuxbarfoo" :end1 6 :end2 7)
(string/= "lisp" "lissome")
(string< "lisp" "lisper")
(string< "foobar" "abaz" :start1 3 :start2 1)

most-positive-fixnum
;; is (1- (expt 2 48))

most-negative-fixnum
;; is (- (expt 2 48))

(random 100)
(random 1)
;; (random 0) should be positive and and integer or float.
;; (random -3)
(floor (random 10.0))

(let ((alst nil) (blst nil) (s (make-random-state)))
  (dotimes (i 10)
    (print (1+ i))
    (push (random (1+ i) s) alst)
    (push (random (1+ i)) blst))
  (format t "~& ~a~%" alst)
  (format t " ~a~%" blst))
;; alst is equal to blst

(let* ((rs1 (make-random-state nil))
       (rs2 (make-random-state t))
       (rs3 (make-random-state rs2))
       (rs4 nil))
  (list (loop for i from 1 to 10
           collect (random 100)
           when (= i 5)
           do (setq rs4 (make-random-state)))
        (loop for i from 1 to 10 collect (random 100 rs1))
        (loop for i from 1 to 10 collect (random 100 rs2))
        (loop for i from 1 to 10 collect (random 100 rs3))
        (loop for i from 1 to 10 collect (random 100 rs4))))

(defmacro my-when (condition &rest body)
  `(if ,condition (progn ,@body)))

(my-when (> 10 8)
         (format t " 10 > 8~%")
         (format t " it is ok~%"))

(dolist (x '(1 2 3))
  (print x))

(dolist (x '(1 2 3))
  (print x)
  (if (evenp x)
      (return)))

(dotimes (i 4)
  (print i))

(dotimes (x 20)
  (dotimes (y 20)
    (format t " ~3d " (* (1+ x)
                         (1+ y))))
  (format t "~%"))

(do ((n 0 (1+ n))
     (cur 0 next)
     (next 1 (+ next cur)))
    ((= 10 n) cur)
  (print cur))

(do ((i 0 (1+ i)))
    ((>= i 4))
  (print i))

(dotimes (i 4)
  (print i))

(do ((nums nil)
     (i 1 (1+ i)))
    ((> i 10)
     (nreverse nums))
  (push i nums))

(loop for i from 1 to 10 collecting i)

(loop for i from 1 to 10 summing (expt i 2))

(loop for x across "the quick brown fox jumps over the lazy dog"
   counting (find x "aeiou"))

(loop for i below 10
   and a = 0 then b
   and b = 1 then (+ b a)
   finally (return a))

(defun primep (number)
  (when (> number 1)
    (loop for fac from 2 to (isqrt number) never
         (zerop (mod number fac)))))

(defun next-prime (number)
  (loop for n from number when (primep n)
     return n))

(primep 20)
(next-prime 32)

(do ((p (next-prime 0)
        (next-prime (1+ p))))
    ((> p 19))
  (format t "~d " p))

(defmacro do-primes (var-and-range &rest body)
  (let ((var (first var-and-range))
        (start (second var-and-range))
        (end (third var-and-range)))
    `(do ((,var (next-prime ,start)
                (next-prime (1+ ,var))))
         ((> ,var ,end))
       ,@body)))

(do-primes (p 3 15)
  (format t "~d " p))

(defmacro do-primes-1 ((var start end) &body body)
  `(do ((,var (next-prime ,start) (next-prime (1+ ,var))))
       ((> ,var ,end))
     ,@body))
(do-primes-1
    (p 3 15)
  (format t "~d " p))

(macroexpand-1 '(do-primes-1
                 (p 3 15)
                 (format t "~d " p)))

(do
 ((p
   (next-prime 3)
   (next-prime (1+ p))))
 ((> p 15))
  (format t "~d " p))

(macroexpand-1 '(defmacro do-primes-1 ((var start end) &body body)
                 `(do ((,var (next-prime ,start) (next-prime (1+ ,var))))
                      ((> ,var ,end))
                    ,@body)))

;; results the following:

(let nil
  (eval-when (compile load eval) (system::remove-old-definitions 'do-primes-1)
             (system::%putd 'do-primes-1
                            (system::make-macro
                             (function do-primes-1
                                       (lambda (system::<macro-form> system::<env-arg>)
                               (declare (cons system::<macro-form>))
                               (declare (ignore system::<env-arg>))
                               (if (not (system::list-length-in-bounds-p system::<macro-form> 2 2 t))
                                   (system::macro-call-error system::<macro-form>)
                                   (let*
                                       ((g3738 (cadr system::<macro-form>))
                                        (g3739
                                         (if (not (system::list-length-in-bounds-p g3738 3 3 nil))
                                             (system::error-of-type 'source-program-error :form
                                                                    system::<macro-form> :detail g3738
                                                                    (system::text "~s: ~s does not match lambda list element ~:s")
                                                                    'do-primes-1 g3738 '(var start end))
                                             g3738))
                                        (var (car g3739)) (start (cadr g3739)) (end (caddr g3739))
                                        (body (cddr system::<macro-form>)))
                                     (block do-primes-1
                                       `(do ((,var (next-prime ,start) (next-prime (1+ ,var))))
                                            ((> ,var ,end)) ,@body))))))
                             '((var start end) &body body))))
  (eval-when (eval)
    (system::%put 'do-primes-1 'system::definition
                  (cons
                   '(defmacro do-primes-1 ((var start end) &body body)
                     `(do ((,var (next-prime ,start) (next-prime (1+ ,var)))) ((> ,var ,end))
                        ,@body))
                   (the-environment))))
  'do-primes-1)

(do-primes-1 (p 0 (random 100))
  (format t "~d " p))
;; results: (with bugs:( )
(do
 ((p
   (next-prime 0)
   (next-prime (1+ p))))
 ((> p (random 100)))
  (format t "~d " p))

(defmacro do-primes-1 ((var start end) &body body)
  `(do ((ending-value ,end)
        (,var (next-prime ,start) (next-prime (1+ ,var))))
       ((> ,var ending-value))
     ,@body))
;; still has bug :(
(do-primes-1 (p 0 (random 100))
  (format t "~d " p))
(do
 ((ending-value (random 100))
  (p
   (next-prime 0)
   (next-prime (1+ p))))
 ((> p ending-value))
  (format t "~d " p))

(defmacro do-primes-1 ((var start end) &body body)
  `(do ((,var (next-prime ,start) (next-prime (1+ ,var)))
        (ending-value ,end))
       ((> ,var ending-value))
     ,@body))
;; swap order of two variable definitions.

(do-primes-1 (p 0 (random 100))
  (format t "~d " p))

(do
 ((p
   (next-prime 0)
   (next-prime (1+ p)))
  (ending-value (random 100)))
 ((> p ending-value))
  (format t "~d " p))
