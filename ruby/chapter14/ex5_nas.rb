#!/usr/bin/ruby 

str = "Ruby is an object oriented programming language"

cnt = Hash.new(0)

str.each_char do |item|
  cnt[item] += 1
end

cnt.keys.sort.each do |item|
  printf("'%s': %s\n", item, "*" * cnt[item])
end
