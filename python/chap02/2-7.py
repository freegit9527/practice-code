#!/usr/bin/env python
str = raw_input("input a string: ")
i = 0
while i < len(str):
	print str[i],
	i += 1
print 

for c in str:
	print c,
print

for i, c in enumerate(str):
	print i, c
print
