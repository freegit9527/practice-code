(defun keyword-sample-1 (a b c &key d e f)
  (list a b c d e f))

(keyword-sample-1 1 2 3)
(keyword-sample-1 1 2 3 :d 4)
(keyword-sample-1 1 2 3 :e 5)
(keyword-sample-1 1 2 3 :e 5 :d 4 :f 6)

(defun keyword-sample-2 (a &key (b 77)
                             (c 88))
  (list a b c))

(keyword-sample-2 1)
(keyword-sample-2 1 :c 3)


