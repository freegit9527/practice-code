;; write clean code. ;-)

;; 17.2, 17.3

(defvar *account-numbers* 0)
(defclass bank-account ()
  ((customer-name
    :initarg :customer-name
    :initform (error "Must supply a customer name.")
    :accessor customer-name
    :documentation "Customer's name")
   (balance
    :initarg :balance
    :initform 0
    :reader balance
    :documentation "Current account balance")
   (account-number
    :initform (incf *account-numbers*)
    :reader account-number
    :documentation "Account number, unique within a bank.")
   (account-type
    :reader account-type
    :documentation "Type of account, one of :gold, :silver or :bronze.")))

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

;; 17.4

(defgeneric balance (account))

(defmethod balance ((account bank-account))
  (slot-value account 'balance))

;; 17.5



(defgeneric (setf customer-name)
    (value account))

(defmethod (setf customer-name)
    (value (account bank-account))
  (setf (slot-value account 'customer-name)
        value))

(setf (customer-name *account*) "Sally")

(defgeneric customer-name (account))

(defmethod customer-name ((account bank-account))
  (slot-value account 'customer-name))

(customer-name *account*)
