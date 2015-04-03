#!/usr/bin/ruby -w

puts "Hello, Ruby!";

print <<EOF
This is the first way.!
EOF

print <<"foo", <<"bar"
I said foo.
foo
I said bar.
bar

puts "Multiplication value: #{24 * 60 * 60}";

print "Who do you want to say hello to? "
hello = "there"

puts "Hello, " + hello + "!"

def  hello 
    puts "Hello, Matz!"
end

hello 
