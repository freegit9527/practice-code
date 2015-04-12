#!/usr/bin/ruby 

file = File.open("sample.txt")

file.each_line do |line|
  print line
end

file.close

puts
puts "*" * 20
puts

File.open("sample1.txt") do |file|
  file.each_line do |line|
    print line
  end
end
