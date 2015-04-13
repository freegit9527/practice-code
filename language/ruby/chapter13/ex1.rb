#!/usr/bin/ruby 

a = Array.new(100) { |i| i + 1 }

p a
puts

a2 = []
a.each do |item|
  a2 << item * 100
end

p a2
puts

a.collect!{|item| item * 100}

p a
puts

