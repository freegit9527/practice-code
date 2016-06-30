#include <stdio.h>
#include <string.h>

int main(void) {

  int a[10], i;

  memset(a, 0, sizeof(a));
  for (i = 0; i < 10; ++i) {
    printf("%d ", a[i]);
  }
  printf("\n");

  printf("sizeof a = %lu\n", sizeof(a));

  return 0;
}
