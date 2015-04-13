#!/usr/bin/ruby 

def reverse(input) 
  File.open(input, "r+") do |f| 
    lines = f.readlines
    f.rewind
    f.truncate(0)
    f.write lines.reverse.join()
  end
end

reverse(ARGV[0])

File.open("./example.txt") do |f| 
  f.each_line { |line| 
    print line
  }
end

