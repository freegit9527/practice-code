#!/usr/bin/ruby 

def ren(path) 
  Dir.glob("#{path}/*.mp3").each do |name| 
    process_file(name)
  end
end

def process_file(name) 
  puts name
end

ren("~/Music")
