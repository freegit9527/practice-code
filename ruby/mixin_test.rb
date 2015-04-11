#!/usr/bin/ruby 

module M 
  def meth 
    "M#meth"
  end
end

module M1 
  Version = "1.0"
end

class C 
  include M
  def meth 
    "C#meth"
  end
  include M1
end

c = C.new
p c.meth
p C.include?(M)

p C.ancestors
p C.superclass

module Edition 
  def edition(n) 
    "#{self} Edition #{n}"
  end
end

str = "Ruby Programming"
str.extend(Edition)

p str.edition(4)
