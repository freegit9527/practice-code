#!/usr/bin/ruby
#

class HelloWorld
    attr_accessor :name
    Version = "1.0"
    @@count = 0

    def HelloWorld.count 
      @@count
    end

    def HelloWorld.third_class_function(x)
        puts "This is the third form of class function #{x}."
    end

    def initialize(myname = "Ruby")
        @name = myname
    end

    def hello 
        puts "Hello, world. I am #{@name}."
        @@count += 1
    end

    class << self
        def func_class(argu)
            puts "This is a class function #{argu}."
        end
    end
end

puts "count = " + HelloWorld.count.to_s
bob = HelloWorld.new("Bob")
bob.hello

bob.name = "lxy"
bob.hello

class << HelloWorld
    def hey(name)
        puts "#{name} is its name."
    end
end

HelloWorld.hey("snowsun")

HelloWorld.func_class("CLASS FUNCTION")

puts "count = " + HelloWorld.count.to_s

HelloWorld.third_class_function("JiaQing")

third = HelloWorld.new
HelloWorld.third_class_function("THIRD")
third.hello

p HelloWorld::Version

puts "count = " + HelloWorld.count.to_s
