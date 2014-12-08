/*
ID: zypz4571
LANG: C++
TASK: char.c
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct A {
	int a;
	int b;
};				/* ----------  end of struct A  ---------- */

typedef struct A A;

struct B {
	int a;
	int b;
};				/* ----------  end of struct B  ---------- */

typedef struct B B;

/* 
 * ===  FUNCTION  ======================================================================
 *         Name: main
 * =====================================================================================
 */

	int
main ( int argc, char *argv[] )
{
	A t;
	t.a = 1;
	t.b = 2;
	A s;
	s = t;
	printf ( "s.a = %d s.b = %d\n", s.a, s.b );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
