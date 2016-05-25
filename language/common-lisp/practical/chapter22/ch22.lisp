(defun foo () (loop for i from 1 to 100
                 if (evenp i)
                 minimize i into min-even and
                 maximize i into max-even and
                 unless (zerop (mod i 4))
                 sum i into even-not-fours-total
                 end
                 and sum i into even-total
                 else
                 minimize i into min-odd and
                 maximize i into max-odd and
                 when (zerop (mod i 5))
                 sum i into fives-total
                 end
                 and sum i into odd-total))

(defvar numbers '(2 4 6 8 10))

(if (loop for i in numbers always (evenp i))
    (print "all numbers are even"))

(if (loop for i in numbers never (oddp i))
    (print "all numbers are even"))

(push 3 numbers)
(print numbers)
(pop numbers)

(if (loop for i in numbers thereis (oddp i))
    (print "there is an odd number"))

(loop for i across "abcdef" thereis (digit-char-p i))
(loop for i across "abc123" thereis (digit-char-p i))
