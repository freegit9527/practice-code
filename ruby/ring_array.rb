#!/usr/bin/ruby 

class RingArray < Array
  def [](i)
    puts "size = " + size.to_s
    idx = i % size
    super(idx)
  end
end

wday = RingArray["Mon", "Tue", "Wed", "Thu", "Fri"]
p wday[4]
p wday[5]
p wday[6]
p wday[-1]

class C1
  def hello
    "Hello"
  end
end

class C2 < C1
  alias old_hello hello 
  def hello 
    "#{old_hello}, again."
  end
end

obj = C2.new
p obj.old_hello
p obj.hello

str1 = "Ruby"
str2 = "Ruby"

class << str1 
  def hello 
    "Hello, #{self}!"
  end
end

p str1.hello
# p str2.hello #=> ERROR

p FileTest.exist?("/usr/bin/ruby")
p FileTest.size("/usr/bin/ruby")

p Math::PI 
p Math.sqrt(2)

include Math

p PI
p sqrt(2)

