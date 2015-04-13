/*
ID: zypz4571
LANG: C++
TASK: pointer.c
 */
#include <stdio.h>
int main(void)
{
	printf("%c\n", 5["abcedf"]);
	printf("%c\n", "abcedf"[5]);

	char a[] = {3, 9, 2};
	printf("%d %d\n", a[2], 2[a]);
	return 0;
}


