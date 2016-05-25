(format t "~s~%" (loop for x from 1 to 9
		    for y = nil then x
		    collect (list x y)))

(format t "~s~%" (loop for x from 1 to 9
		    and for y = nil then x
		    collect (list x y)))

(loop as i from 1 to 5
   do (print i))

(loop for i from 10 downto 1 by 3
   do (print i))

(loop as i below 5
   do (print i))

(loop for ele in '(1 2 3 4 5)
   do (print ele))

(loop for ele in '(1 2 3 4 5) by #'cddr
   do (print ele))
  
(loop for x being each present-symbol of "COMMON-LISP-USER"
   do (print x))

(loop repeat 3
     do (format t "~%What I say three times is true"))

(let ((stack '(a b c d e f)))
  (format t "~s~%" (loop for item = (length stack) then (pop stack)
		      collect item
		      while stack)))

(loop for i from 3
   when (oddp i) collect i
   while (< i 5))


