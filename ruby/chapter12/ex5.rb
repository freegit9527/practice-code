#!/usr/bin/ruby 

def prime?(num)
  if 2 == num 
    true
  else 
    2.upto(Math.sqrt(num).to_i + 1) do |i|
      if num % i == 0
        return false
      end
    end
    true
  end
end

2.upto(100) do |i|
  if prime?(i) 
    print i, " "
  end
end

puts
