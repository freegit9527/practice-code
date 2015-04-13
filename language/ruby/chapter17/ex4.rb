#!/usr/bin/ruby 

def reverse(input) 
  File.open(input, "r+") do |f| 
    lines = f.readlines
    f.rewind
    f.truncate(0)
    f.write lines[-1]
  end
end

reverse(ARGV[0])

File.open(ARGV[0]) do |f| 
  f.each_line { |line| 
    print line
  }
end



