#!/usr/bin/ruby 
#

class Hello
    def howdy
        greeting = "Hello, snow!"
        puts greeting
    end
end

class Goodbye < Hello
    def solong
        farewell = "Goodbye, snow."
        puts farewell
    end
end

friendly = Goodbye.new
friendly.howdy
friendly.solong


