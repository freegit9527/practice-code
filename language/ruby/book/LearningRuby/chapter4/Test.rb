#!/usr/bin/ruby 

comedy = %!As
You
Like It!
puts comedy

num = 5
str = %Q(This 
is #{num} and
as we know)
puts str

command = %x[
ls -alh
]
puts command

ind = <<hello
Hello, Matz!
hello

puts ind

ind1 = <<-hello
  Hello, Matz!
hello

puts ind1

ind2 = <<hello
  Hello, Matz!
hello
puts ind2
