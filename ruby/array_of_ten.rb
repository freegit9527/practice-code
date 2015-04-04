#!/usr/bin/ruby 
#

class Array

    def array_of_ten
        (1..10).to_a
    end

end

arr = Array.new 
ten = arr.array_of_ten
p ten
