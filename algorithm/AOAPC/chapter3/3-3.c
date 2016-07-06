#include <stdio.h>
#include <string.h>

const int maxn = 10;
int a[maxn][maxn];

int main(void) {
  int n;
  while (scanf("%d", &n) == 1) {
    int len = n * n, start_n = 1, i = 1, j = n;
    memset(a, 0, sizeof(a));

    while (1) {
      // down
      while (i <= n && a[i][j] == 0) {
        a[i][j] = start_n;
        ++start_n;
        ++i;
      }
      --i; --j;
      // left
      while (j >= 1 && a[i][j] == 0) {
        a[i][j] = start_n;
        ++start_n;
        --j;
      }
      ++j; --i;
      // up
      while (i >= 1 && a[i][j] == 0) {
        a[i][j] = start_n;
        ++start_n;
        --i;
      }
      ++i; ++j;
      // right
      while (j <= n && a[i][j] == 0) {
        a[i][j] = start_n;
        ++start_n;
        ++j;
      }
      --j; ++i;
      if (start_n > len) break;
    }
    for (int i = 1; i <= n; ++i) {
      for (int j = 1; j <= n; ++j) {
        printf("%3d", a[i][j]);
      }
      printf("\n");
    }
  }

  return 0;
}
