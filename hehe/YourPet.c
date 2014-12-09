/*
 * =====================================================================================
 *
 *       Filename:  YourPet.c
 *
 *    Description:  address of parameter.
 *
 *        Version:  1.0
 *        Created:  02/05/14 11:55:01
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  liuxueyang (lxy), zypz457@sina.com
 *   Organization:  Hunan University
 *
 * =====================================================================================
 */
f()
{
	printf("Hello\n");
}
#include<stdio.h>
main()
{
	int i;
	printf("%0llx %0llx",(long long)&i,(long long)&i-4);
	*(&i-4)=3;
	printf("j = %d\n",*(&i-4));
	printf("f = %0llx\n",(long long)&f);
}
