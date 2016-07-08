/*
  Uva 1588
  2016/07/08 09:21:07 AM
 */

#include <stdio.h>
#include <string.h>

char a[120], b[120], tmp[120];

int main(void) {
  #ifdef DEBUG
  freopen("uva-1588-1.txt", "r", stdin);
  #endif

  /* int kase = 0; */
  while (scanf("%s", a) != EOF) {
    scanf("%s", b);
    /* printf("Case #%d:\n", ++kase); */
    int len1 = strlen(a), len2 = strlen(b);
    if (len1 < len2) {
      strcpy(tmp, a);
      strcpy(a, b);
      strcpy(b, tmp);
    }
    len1 = strlen(a);
    len2 = strlen(b);
    /* a is longer */

    int mark = 1;
    int ans = len1 + len2;

    /* b[0] is left to a[0] */
    for (int j = len2 - 1; j >= 0; --j) {
      for (int i = 0; i < len1; ++i) {
        if (i + j >= len2) break;
        if (b[i + j] == '2' && a[i] == '2') {
          mark = 0;
          break;
        }
      }
      if (mark) {
        int tmp = j + len1;

        if (tmp < ans) {
          ans = tmp;
        }
      }
      mark = 1;
    }

    /* a[0] is on the left of b[0] */
    mark = 1;
    for (int i = 0; i < len1; ++i) {
      for (int j = 0; j < len2; ++j) {
        if (i + j >= len1) break;
        if (a[i + j] == '2' && b[j] == '2') {
          mark = 0;
          break;
        }
      }

      if (mark) {
        int tmp = i + len2;

        if (tmp < len1) {
          tmp = len1;
          ans = len1;
          break;
        }
        if (tmp < ans) {
          ans = tmp;
        }
      }
      mark = 1;
    }

    printf("%d\n", ans);
  }

  return 0;
}
