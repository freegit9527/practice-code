(defun mary ()
  (format t "~&Mary had a little bat.")
  (format t "~&Its wings were long and brown.")
  (format t "~&And everywhere that Mary went")
  (format t "~&The bat went, upside-down."))

(mary)

(defun test (x)
  (format t "~&with escape characters: ~s" x)
  (format t "~&with escape characters: ~a" x))

(test "Hi, mom")
