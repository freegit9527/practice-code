#!/usr/bin/python2.7 

IN = lambda:raw_input()
x = int(IN())
y = int(IN())
try:
	print x/y
except ZeroDivisionError:
	print "The second number can not be zero!"
