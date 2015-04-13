/*
 * =====================================================================================
 *       Filename : interst_double.c
 *    Description : Note that the definition and declaration of square! 
 *    							The program runs normaly.
 *    Version     : 
 *        Created : 11/12/14 22:39
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
double square();
main()
{
	double i = 3;
	printf ( "%g\n", square(i) );
}
double square(double x) {
	return x * x;
}
