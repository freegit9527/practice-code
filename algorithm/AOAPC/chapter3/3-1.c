#include <stdio.h>

int a[101];
int main(void) {
  int n = 0;
  while (scanf("%d", &a[n]) == 1) {
    ++n;
  }
  for (int i = n - 1; i > 0; --i) {
    printf("%d ", a[i]);
  }
  printf("%d\n", a[0]);

  return 0;
}
