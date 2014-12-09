/*
ID: zypz4571
LANG: C++
TASK: prime.c
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
const int MAXN = 10000000;
int flag[MAXN];
int a[MAXN], N;
int main(void) {
	memset(flag, 0, sizeof(flag));
	scanf("%d", &N);
	int i, j;
	for (i = 2; i <= N; ++i) {
		for (j = i * 2; j <= N; j+=i) {
			if (!flag[j]) {
				flag[j] = 1;
			}
		}
	}
	for (j = 0, i = 2; i <= N; ++i) {
		if (!flag[i]) {
			a[j++] = i;
		}
	}
	for (i = 0; i < j; ++i) {
		printf("%d ", a[i]);
	}
	printf("\n");

	return 0;
}


