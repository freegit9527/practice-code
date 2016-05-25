;;;; dtnl.asd

(asdf:defsystem #:dtnl
  :description "my game test"
  :author "aries <liuxueyang457@gmail.com>"
  :license "Specify license here"
  :depends-on (#:xelf)
  :serial t
  :components ((:file "package")
               (:file "dtnl")))

