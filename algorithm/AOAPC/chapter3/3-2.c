#include <stdio.h>
#include <string.h>

const int maxn = 1000 + 10;
int a[maxn];

int main(void) {
  int n, k;
  while (scanf("%d%d", &n, &k) == 2) {
    memset(a, 0, sizeof(a));
    for (int i = 1; i <= k; ++i) {
      for (int j = 1; j <= n; ++j) {
        if (j % i == 0) {
          a[j] = 1 - a[j];
        }
      }
    }
    int first_n = 1;
    for (int i = 1; i <= n; ++i) {
      if (a[i]) {
        if (first_n == 0) {
          printf(" ");
        }
        printf("%d", i);
        if (first_n == 1) {
          first_n = 0;
        }
      }
    }
    printf("\n");
  }

  return 0;
}
