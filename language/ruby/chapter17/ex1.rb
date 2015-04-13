#!/usr/bin/ruby 

def wc(file) 
  nline = nword = nchar = 0
  File.open(file) { |io| 
    io.each { |line| 
      nline += 1
      #nword += line.strip.split(/\s+/).length
      #words = line.split(/\s+/).reject{|w| w.empty?}
      #nword += words.length
      nword += line.split(/\s+/).reject{|w| w.empty?}.length
      nchar += line.length
    }
  }
  puts "lines = #{nline} words = #{nword} chars = #{nchar}"
end

wc(__FILE__)
