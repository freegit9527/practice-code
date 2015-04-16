/*
ID: zypz4571
LANG: C++
TASK: array.c
 */
#include <stdio.h>
struct Test
{
	int Num;
	char *pcName;
	short sDate;
	char cha[2];
	short sBa[4];
}*p;
int main(void) 
{
	char a[5] = {'A', 'B', 'C', 'D'};
	char (*p3)[3] = &a;
	char (*p4)[3] = a;
	printf("%c\n", *((*p3)+1));
	printf("%c\n", *(*p4));
	printf("%c\n", *(*(p3+1)));
	printf("%c\n", *(*(p4+1)-1));
	printf("sizeof Test = %lu\n", sizeof(struct Test));

	return 0;
}
