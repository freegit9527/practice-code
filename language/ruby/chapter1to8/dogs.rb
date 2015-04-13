#!/usr/bin/ruby 

class Dog
    attr_reader :bark
    attr_writer :bark
end

dog = Dog.new

dog.bark = "Woof!"
puts dog.bark

puts dog.instance_variables.sort
p Dog.instance_methods.sort - Object.instance_methods
