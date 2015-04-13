#!/usr/bin/python2 

from copy import deepcopy

D = {'a':1, 'b':2, 'c':3}
E = deepcopy(D)
print D
Ks = list(D.keys())
Ks.sort()
for key in Ks:
	print key, '=>', D[key]

print 'D:', D

print 'E:', E
print 'sort in another way:'
for key in sorted(E):
	print key, '=>', E[key]
