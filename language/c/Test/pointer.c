/*
ID: zypz4571
LANG: C++
TASK: pointer.c
 */
#include <stdio.h>

/*  Name:  foo
 *  Description:  
 */
  int
foo ( int a )
{
  printf ( "a = %d\n", a );
  return 0;
}		/* -----  end of function foo  ----- */
int main(void)
{
	printf("%c\n", 5["abcedf"]);
	printf("%c\n", "abcedf"[5]);

	char a[] = {3, 9, 2};
	printf("%d %d\n", a[2], 2[a]);

  int (*p)(int);
  p = &foo;

  (*p)(300);
	return 0;
}


