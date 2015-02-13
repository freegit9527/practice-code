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
    (cond ((characterp char)
           (sub-letter char))
          ((equal char 'undo)
           (undo-letter))
          ((equal char 'end) (return-from solve t))
          (t (format t "error input")))))

(setf crypto-text
      '("zj ze kljjls jf slapzi ezvlij pib kl jufwxuj p hffv jupi jf" "enlpo pib slafml pvv bfwkj"))

(solve crypto-text)