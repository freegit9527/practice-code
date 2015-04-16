#!/usr/bin/ruby 

require 'io/console'
def read_char 
  STDIN.echo = false 
  STDIN.raw!

  input = STDIN.getc.chr 
  if input == "\e" 
    input << STDIN.read_nonblock(3) rescue nil
    input << STDIN.read_nonblock(2) rescue nil
  end 
ensure 
  STDIN.echo = true
  STDIN.cooked!
  return input
end

def show_single_key 
  c = read_char 
  case c 
  when " "
    puts "SPACE"
  when "\e"
    puts "ESCAPE"
  when "\e[A"
    puts "UP"
  when "\e[B"
    puts "DOWN"
  when "\e[C"
    puts "RIGHT"
  when "\e[D"
    puts "LEFT"
  when "\u0003"
    puts "CONTROL-C"
  end 
end

show_single_key while true
