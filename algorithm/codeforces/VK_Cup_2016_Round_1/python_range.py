#!/usr/bin/env python 

pairs= []
pairs = [(i,j) for i in range(0,6) for j in range(i+1, 6)]
print pairs

num = []
for i in range(0, 6):
    num = num + [i]

print num
