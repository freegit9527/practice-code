(defun digit-sum (n)
  (do ((cur 1 (1+ cur))
       (arr (make-array 20))
       (sign 1)
       (ans 0)
       (index 0 0))
      ((> cur n) ans)
    (do ((i cur (floor i 10)))
        ((zerop i))
      (setf (elt arr index) (mod i 10)
            index (1+ index)))
    (loop for i from (1- index) downto 0
          do (incf ans (* sign (elt arr i)))
             (setf sign (- sign))
          finally (return ans))))

(defun get-sum-1 (n k)
  "n is number of free digis. k is length of number.
return digits sum of [00..0,99..9]"
  (if (evenp k)
      (if (evenp n)
          0
          (- (* 45 (expt 10 (1- n)))))
      (- (/ (expt 10 n)
            2))))

(defun get-sum-2 (prefix n)
  "prefix is common prefix, n is number of free digits.
return digit sum of [prefix00..0,prefix99..9]"
  (let* ((presum 0)
         (ans 0)
         (sign 1)
         (d (1+ (floor (log prefix 10))))
         (k (+ n d)))
    (do ()
        ((zerop prefix))
      (incf presum (* sign (mod prefix 10)))
      (setf sign (- sign)
            prefix (floor prefix 10)))
    (setf presum (* presum (- sign)))
    (if (evenp k)
        (incf ans (* presum (expt 10 n))))
    (incf ans (get-sum-1 n k))))

(defun get-sum-3 (n)
  (let* ((sign 1)
         (ans 0)
         (d (floor (log n 10)))
         (tn n)
         (arr (make-array 20))
         (prefix 0))
    (if (<= n 9)
        (loop for i from 1 to n
              do (incf ans (* i sign))
                 (setf sign (- sign))
              finally (return-from get-sum-3 ans)))
    (setf ans 5)
    (loop for i from 1 to (1- d)
          do (loop for j from 1 to 9
                   do (decf ans (get-sum-2 j i))))
    (do* ((p (expt 10 d))
          (msd (floor tn p) (floor tn p)))
         ((<= d 0))
      (loop for i from 1 to msd
            do (if (plusp prefix)
                   (decf ans (get-sum-2 prefix d)))
               (incf prefix))
      (setf prefix (* prefix 10)
            tn (mod tn p)
            p (floor p 10))
      (decf d))
    (setf sign -1)
    (loop for i from 0 to tn do
      (let ((cur (+ i prefix))
            (j 0))
        (do ()
            ((<= cur 0))
          (setf (elt arr j) (mod cur 10)
                j (1+ j)
                cur (floor cur 10)))
        (loop for k from (1- j) downto 0
              do (incf ans (* sign (elt arr k)))
                 (setf sign (- sign))))
          finally (return ans))))

;; (print (get-sum-3 (floor (expt 10 15))))
;; (print (get-sum-3 100))

;; (with-open-file
;;     (*standard-input*
;;      "input.txt"
;;      :if-does-not-exist nil))
;; (with-open-file
;;     (*standard-output*
;;      "output5.txt"
;;      :if-exists :supersede
;;      :direction :output))
(loop for a = (read *standard-input* nil nil)
      until (zerop a)
      do (format *standard-output* "~d~%"
                 (get-sum-3 a)))
