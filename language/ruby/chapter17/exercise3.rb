#!/usr/bin/ruby 

def tail(line, file) 
  File.open(file, "r") do |f| 
    lines = f.readlines
    (-line..-1).each do |line| 
      printf("%4s: %s", -line, lines[line])
    end
  end
end

tail(10, ARGV[0])

#ANOTHER ANSWER
def tail_answer(lines, file) 
  queue = Array.new
  open(file) do |io| 
    while line = io.gets 
      queue.push(line) 
      if queue.size > lines 
        queue.shift 
      end
    end
  end
  queue.each {|line| print line}
end

puts "==="
tail_answer(10, __FILE__)


puts "==="
tail_answer(3, __FILE__)
