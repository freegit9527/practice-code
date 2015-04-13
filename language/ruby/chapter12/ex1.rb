#!/usr/bin/ruby 

def cels2fahr(c)
  return c * 9 / 5 + 32
end

def fahr2cels(f)
  return (f - 32) * 5 / 9
end

1.upto(100) do |i|
  print cels2fahr(i), " "
end

puts
