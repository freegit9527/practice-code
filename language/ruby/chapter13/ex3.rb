#!/usr/bin/ruby 

a = Array.new(100) { |i| i + 1 }

a3 = a.reject{|item| item % 3 != 0}

p a3
puts

a.reject!{|item| item % 3 != 0}
p a
puts
