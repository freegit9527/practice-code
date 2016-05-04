(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for i in names collect `(,i (gensym)))
     ,@body))

(defvar *liu-var* "hello")
(defmacro mac (expression)
  `(pprint (macroexpand-1 ',expression)))

(defmacro print-sth (some)
  `(print ,some))

(defmacro test-sth (var some)
  `(setf ,var
         ,(print-sth some)))

(test-sth *liu-var* "xueyang")
(mac (test-sth *liu-var* "xueyang"))

(format t "Hello, ~S" *liu-var*)

