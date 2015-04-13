#!/usr/bin/ruby 

def str2hash(str)
  h = Hash.new
  ary = str.split(/\s+/)
  while key = ary.shift
    value = ary.shift
    h[key] = value
  end
  h
end

p str2hash("a b c d e f")
