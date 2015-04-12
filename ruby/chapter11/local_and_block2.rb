#!/usr/bin/ruby 

x = y = z = 0
ary = [1, 2, 3]
ary.each do |x; y, z|
  y = x
  z = x
  p [x, y, z]
end

puts

p [x, y, z]
