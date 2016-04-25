;; 17.2

(defclass bank-account ()
  ((customer-name
    :initarg :customer-name
    :initform "aries")
   (balance
    :initarg :balance
    :initform 0)))

(defparameter *account*
  (make-instance 'bank-account
                 :customer-name "aries-liu"))
;; (setf (slot-value *account* 'customer-name) "liu")
;; (setf (slot-value *account* 'balance) 1000)
(slot-value *account* 'balance)
