#!/usr/bin/ruby 

require 'io/console'

a, b = IO.console.winsize 
print a, " ", b, "\n"
