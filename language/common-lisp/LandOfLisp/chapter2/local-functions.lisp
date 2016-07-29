;; use of local function
;; 2016.07.29

(flet ((f (n)
         (+ n 10))
       (g (n)
         (- n 3)))
  (g (f 5)))

;; use labels we can call local functions from another.
;; we can also use it to define recursive functions.
(labels ((a (n)
           (+ n 5))
         (b (n)
           (+ (a n)
              6)))
  (b 10))
