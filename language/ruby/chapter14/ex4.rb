#!/usr/bin/ruby 

# exercise 4
str = "Ruby is an object oriented programming language"

result = ""
str.split(' ').each do |item|
  result << item.capitalize
  result << " "
end

result.strip!
p result

#THE OTHER ANSWER 

ary = str.split 
cap_ary = ary.collect{|item| item.capitalize}
result = cap_ary.join(" ")
p result
