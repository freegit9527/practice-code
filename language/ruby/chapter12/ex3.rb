#!/usr/bin/ruby 

def dice
  r = Random.new 
  return 1 + r.rand(6)
end

1.upto(6) do
  print dice, " "
end

puts

6.times do 
  print dice, " "
end

puts

def dice10
  result = 0
  10.times do 
    result += dice
  end
  return result
end

puts dice10
