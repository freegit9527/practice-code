/*
 * =====================================================================================
 *       Filename : define_foo.c
 *    Description : 
 *    Version     : 
 *        Created : 11/13/14 14:35
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#define f(x) ((x)-1)
typedef int x;
main()
{
	int a = 3;
	int x = 5;
//	f(3);
	printf ( "%d\n",f(3) );
	a += x ? x + 1:0;
}

