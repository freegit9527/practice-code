# CC is the compiler to use
CC=g++-mp-4.8
CFLAGS=-Wall -DDEBUG --std=c++11
source: a b c d
%: %.cpp
	$(CC) $(CFLAGS) $< -o $@
