/*
ID: zypz4571
LANG: C++
TASK: char.c
 */
#include <stdio.h>
#include <string.h>
typedef struct node
{
	int a, b;
}A;
typedef struct Node
{
	int a, b;
}B;
A t;
int main(void) {
	t.a = 1; t.b = 2;
	A s;
	s = t;
	printf("%d %d\n", s.a, s.b);
	return 0;
}


