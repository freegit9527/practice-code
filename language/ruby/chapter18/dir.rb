#!/usr/bin/ruby 

dir = Dir.open(".")
while name = dir.read 
  p name
end

dir.close
