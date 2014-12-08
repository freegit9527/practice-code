/*
	C语言中，函数返回值类型如果不写，那么默认是int类型的。
*/
#include <stdio.h>
add(int a, int b)
{
	return a + b;
}
int main(void)
{
	printf("2 + 3 = %d\n", add(2, 3));
	
	return 0;
}
