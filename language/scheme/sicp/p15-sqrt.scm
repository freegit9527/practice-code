(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define
  (improve guess x)
  (average guess (/ x guess)))

(define
  (good-enough? guess y)
  (< (abs (- (square guess) y))
     0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(my-sqrt 9)
(my-sqrt 15)
(sqrt 15)

(my-sqrt 0.00009)
;; 0.0322032438128213
(sqrt 0.00009)
;; 0.00948683298050514

