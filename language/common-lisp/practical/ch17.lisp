;; 17.2, 17.3

(defvar *account-numbers* 0)
(defclass bank-account ()
  ((customer-name
    :initarg :customer-name
    :initform (error "Must supply a customer name."))
   (balance
    :initarg :balance
    :initform 0)
   (account-number
    :initform (incf *account-numbers*))
   account-type))

(defmethod initialize-instance :after ((account bank-account)
                                       &key opening-bonus-percentage)
  (let ((balance (slot-value account 'balance)))
    (setf (slot-value account 'account-type)
          (cond ((>= balance 100000) :gold)
                ((>= balance 50000) :silver)
                (t :bronze)))
    (when opening-bonus-percentage
      (incf (slot-value account 'balance)
            (* balance (/ opening-bonus-percentage 100))))))

(defparameter *account*
  (make-instance 'bank-account
                 :customer-name "aries-liu"
                 :balance 1000
                 :opening-bonus-percentage 5))

(slot-value *account* 'balance)

;; 16.4
(defgeneric withdraw (account amount)
  (:documentation "Withdraw the specified amount from the account.
Signal an error if the current balance is less than the amount."))

(defmethod withdraw ((account bank-account)
                     amount)
  (when (< (slot-value account 'balance)
           amount)
    (error "Account overdrawn."))
  (decf (slot-value account 'balance)
        amount))
