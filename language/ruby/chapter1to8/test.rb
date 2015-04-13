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

["Hello, ", "Matz!", " each\n"].each { |e| print e }

class Hello

    def initialize (name)
        @name = name
    end

    def hello_matz
        puts "Hello, " + @name + "!"
    end
    
end

#hi = Hello.new("Veo")
#hi.hello_matz
#
#hell = TkRoot.new
#TkLabel.new(hello) do
#    text "\n Hello, phoenix! \n"
#    pack
#end
#
#Tk.mainloop
#


