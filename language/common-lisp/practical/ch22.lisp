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
