#!/usr/bin/ruby 

def copy(from, to) 
  File.open(from) do |input| 
    File.open(to, "w") do |output| 
      output.write(input.read)
    end
  end
end

#copy(ARGV[0], ARGV[1])

require "fileutils"

FileUtils.cp("data.txt", "backup/data.txt")
FileUtils.mv("data.txt", "backup/data1.txt")
