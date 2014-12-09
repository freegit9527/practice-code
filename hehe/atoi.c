/*
ID: zypz4571
LANG: C++
TASK: atoi.c
 */
#include <stdio.h>
#include <limits.h>
#include <math.h>
#include <stdlib.h>
#include <float.h>
int main(void)
{
	char *s = "345";
	printf("%d\n", atoi(s));

	div_t a = div(34, 2);
	printf("a.quot = %d a.rem = %d\n", a.quot, a.rem);
	system("ls;cal");
	printf("%lf\n", ldexp(10.0, 10));
	printf("%u\n", UINT_MAX + 1 - 1);
	printf("%f\n", FLT_MAX);
	return 0;
}


