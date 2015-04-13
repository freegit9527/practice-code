#!/usr/bin/ruby 

str = "Ruby is an object oriented programming language"

dic = {}

str.each_char do |item|
  if dic[item]
    dic[item] += 1
  else
    dic[item] = 1
  end
end

dic.each do |item, value|
  print "'#{item}': "
  value.times do 
    print '*'
  end
  puts
end

puts
