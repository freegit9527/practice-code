#!/usr/bin/ruby 

a = Array.new(100) { |i| i + 1 }

a.sort_by!{|i| -i}

p a
puts
