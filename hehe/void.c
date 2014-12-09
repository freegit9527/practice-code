/*
ID: zypz4571
LANG: C++
TASK: void.c
 */
/*
	void类型的指针使用。可以将任何类型的指针赋值给void类型的指针
变量，但是不能将void类型的指针变量赋值给其它特定类型的指针变量。
*/
#include <stdio.h>
int main(void) {
	int *p;
	void *q;
	int a = 3;
	p = &a;
	printf("*p = %d\n", *p);
	q = p; 
	printf("*q = %d\n", *(int*)q);
	return 0;
}


