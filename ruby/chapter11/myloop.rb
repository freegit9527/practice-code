#!/usr/bin/ruby 

def myloop 
  while true
    yield
  end
end

num = 1
myloop do
  break if num > 100
  puts "num is #{num}"
  num *= 2
end
