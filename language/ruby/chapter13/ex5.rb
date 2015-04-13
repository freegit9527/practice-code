#!/usr/bin/ruby 

a = Array.new(100) { |i| i + 1 }

result = 0
a.each do |item|
  result += item
end

puts result
