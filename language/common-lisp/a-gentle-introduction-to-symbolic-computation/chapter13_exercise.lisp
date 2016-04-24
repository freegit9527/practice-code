;;; ##############################
;;;                              #
;;;     chapter 13 Arrays,       #
;;;      Hash Tables, And        #
;;;       Property Lists         #
;;;        Exercise code         #
;;;         2015/01/11           #
;;;                              #
;;; ##############################



;; ==============================
;; ==============================

;; 13.1

(defun subprop (sym elem prop)
  (setf (get sym prop)
        (remove elem (get sym prop))))

(setf (get 'alpha 'fooprop) '(a b c d e))
(subprop 'alpha 'd 'fooprop)
(get 'alpha 'fooprop)

;; 13.2

(defun forget-meeting (persona personb)
  (subprop persona personb 'has-met)
  (subprop personb persona 'has-met)
  t)

(symbol-plist 'little-red)
(symbol-plist 'wolfie)
(symbol-plist 'grandma)

(forget-meeting 'wolfie 'grandma)
(get 'wolfie 'has-met)
(get 'grandma 'has-met)

;; 13.3

(defun my-get (sym prop)
  (second (member prop (symbol-plist sym))))

(my-get 'little-red 'has-met)
(get 'little-red 'has-met)

;; 13.4

(defun hasprop (sym prop)
  (do* ((prop-list (symbol-plist sym) (nthcdr 2 prop-list)))
       ((equal prop (first prop-list)) t)
    (when (null prop-list)
      (return nil))))

(hasprop 'little-red 'has-met)
(hasprop 'little-red 'has)

;; Array Keyboard Exercise 

;; 13.8 

;; a.

(setf *hist-array* nil)

(setf *total-points* 0)

;; b.

(defun new-histogram (bin)
  (setf *hist-array* (make-array bin :initial-element 0))
  (setf *total-points* 0))

(new-histogram 11)
(setf *print-array* t)
(new-histogram 10)

;; c.

(defun record-value (num)
  (incf *total-points*)
  (if (<= 0 num (1- (length *hist-array*)))
      (incf (aref *hist-array* num))
      (error "~S is out of range" num)))

(record-value 1)

;; d.

(defun print-hist-line (num)
  (let ((cnt (aref *hist-array* num)))
    (format t "~&~2S" num)
    (format t " [~3S] " cnt)
    (dotimes (i cnt)
      (format t "*"))))

(print-hist-line 1)

;; e. 

(dotimes (i 300)
  (record-value (random 11)))

(defun print-histogram ()
  (dotimes (i (length *hist-array*))
    (print-hist-line i))
  (format t "~&    ~3D total" *total-points*))

(print-histogram)

;; Hash Table Keyboard Exercise

;; 13.9

(setf crypto-text nil)

;; a.

(setf *encipher-table* (make-hash-table))
(setf *decipher-table* (make-hash-table))

;; b.

(defun make-substitution (chara charb)
  (setf (gethash chara *decipher-table*) charb)
  (setf (gethash charb *encipher-table*) chara)
  t)

;; c.

(defun undo-substitution (letter)
  (setf (gethash (gethash letter *decipher-table*)
                 *encipher-table*) nil)
  (setf (gethash letter *decipher-table*) nil)
  t)

;; d.

(defun clear ()
  (clrhash *decipher-table*)
  (clrhash *encipher-table*))

;; e.

(defun decipher-string (str)
  (let ((new-str (make-string (length str) 
                              :initial-element #\Space)))
    (dotimes (pos (length str))
      (if (gethash (aref str pos) *decipher-table*)
          (setf (aref new-str pos) 
                (gethash (aref str pos) *decipher-table*))))
    new-str))

;; f.

(defun show-line (str)
  (format t "~&~A" str)
  (format t "~&~A" (decipher-string str)))


;; g.

(defun show-text (str-lst)
  (format t "~&------------------------------")
  (dolist (lst str-lst)
    (show-line lst))
  (format t "~&------------------------------"))


;; h.

(defun get-first-char (x)
  (char-downcase 
   (char (format nil "~A" x) 0)))

;; i.

(defun read-letter ()
  (let ((obj (read)))
    (cond ((equal obj 'END) obj)
          ((equal obj 'UNDO) obj)
          (t (get-first-char obj)))))


;; j.
(defun sub-letter (char)
  (let ((tochar))
    (cond ((gethash char *decipher-table*)
           (format t "'~A' has already been deciphered as '~A'!"
                   char (gethash char *decipher-table*)))
          (t (format t "~&What does '~A' decipher to? " char)
             (setf tochar (read-letter))
             (if (gethash tochar *encipher-table*)
                 (format t "But '~A' already deciphers to '~A'!"
                         (gethash tochar *encipher-table*) tochar)
                 (make-substitution char tochar))))))


;; k
(defun undo-letter ()
  (format t "Undo which letter? ")
  (let ((char (read-letter)))
    (if (gethash char *decipher-table*)
        (undo-substitution char)
        (format t "'~A' has not been deciphered."
                char))))


;; l
;; Only code when you consider it all!

(defun solve (cryp)
  (do ((char nil))
      ((equal char 'end) t)
    (show-text cryp)
    (format t "~&Substitute which letter? ")
    (setf char (read-letter))
    (cond ((characterp char) (sub-letter char))
          ((equal char 'undo) (undo-letter))
          ((equal char 'end) (return-from solve t))
          (t (format t "error input")))))

(setf crypto-text
      '("zj ze kljjls jf slapzi ezvlij pib kl jufwxuj p hffv jupi jf" "enlpo pib slafml pvv bfwkj"))

(solve crypto-text)

