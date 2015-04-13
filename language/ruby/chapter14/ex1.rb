#!/usr/bin/ruby 

# exercise 1
str = "Ruby is an object oriented programming language"

ar = str.split(' ')
p ar

# exercise 2
ar_sort = ar.sort

p ar_sort

#exercise 3
ar_ig_sort = []
ar_sort.each do |item|
  ar_ig_sort << item.downcase
end

ar_ig_sort.sort!

p ar_ig_sort

#exercise 3 THE OTHER ANSWER

p ar.sort_by{|item| item.downcase}
