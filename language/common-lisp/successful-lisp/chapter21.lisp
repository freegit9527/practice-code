(defun keyword-sample-1 (a b c &key d e f)
  (list a b c d e f))

(keyword-sample-1 1 2 3)
(keyword-sample-1 1 2 3 :d 4)
(keyword-sample-1 1 2 3 :e 5)
(keyword-sample-1 1 2 3 :e 5 :d 4 :f 6)
