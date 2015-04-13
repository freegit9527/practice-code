#!/usr/bin/ruby 
#

class Hello

    def initialize (name)
        @name = name
    end

    def hello_veo
        puts "Hello, " + @name + "!"
    end

end

hi = Hello.new("Veo")
hi.hello_veo

class Horse

    def name
        @name
    end

    def name= (value)
        @name = value
    end

end

h = Horse.new
h.name= "Poco Bueno"
puts h.name

1.upto(5) do |i|
    puts "#{i}. Infinity, the start that would not die"
end
