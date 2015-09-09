(defun foo (a b &optional c d)
  (list a b c d))

(defun make-rectangle (width &optional (height width))
  (* width height))

(defun foo (a b &optional (c 3 c-supplied-p))
  (list a b c c-supplied-p))

(defun foo
    (&key ((:apple a) 0) ((:box b) 0 b-supplied-p) ((:charlie c) (+ a b)))
  (list a b c b-supplied-p))

(defun foo (&rest rest &key a b c)
  (list rest a b c))
