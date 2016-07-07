/*
  UVa 455 - Periodic Strings
  2016/07/07 12:01:17 PM
 */
#include <stdio.h>
#include <string.h>

char a[100];

int main(void) {
  #ifdef DEBUG
  freopen("uva-455.txt", "r", stdin);
  #endif

  int T; scanf("%d", &T);
  while (T--) {
    scanf("%s", a);
    int len = strlen(a);
    int ans = len + 1, i;

    for (i = 1; i <= len / 2; ++i) {
      if (len % i) continue;
      int num = len / i, j, mark = 1;

      for (j = 0; j < i; ++j) {
        int k;
        for (k = 1; k < num; ++k) {
          if (a[j] != a[j + k * i]) {
            mark = 0; break;
          }
        }
        if (!mark) break;
      }

      if (mark && ans > i) {
        ans = i;
      }
    }

    if (ans == len + 1) printf("%d\n", len);
    else printf("%d\n", ans);

    if (T) printf("\n");
  }

  return 0;
}
