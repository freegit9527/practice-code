#!/usr/bin/ruby 

puts 'I am in class = ' + self.class.to_s
puts 'I am an object = ' + self.to_s 
print 'The object methods are = '
puts self.private_methods.sort


