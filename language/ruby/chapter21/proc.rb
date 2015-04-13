#!/usr/bin/ruby 

leap = Proc.new do |year| 
  year % 4 == 0 && year % 100 != 0 || year % 400 == 0
end

p leap.call(2000)
p leap[2013]
p leap[2014]

double = Proc.new do |*args| 
  args.map{ |i| i * 2 }
end

p double.call(1, 2, 3)
p double[2, 3, 4]

def power_of (n) 
  lambda do |x| 
    return x ** n 
  end
end

cube = power_of(3)
p cube[5]
