#!/usr/bin/ruby 

mar = Array.new(6, 0)

mar.each_with_index { |i, index| 
  print i, " ", index
  puts
}

def modify(mar) 
  mar.each_with_index { |item, index| 
    mar[index] = index
  }
end

modify(mar)

mar.each_with_index { |i, index| 
  print i, " ", index
  puts
}
