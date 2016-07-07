/*
  Uva 340 - Master-Mind Hints
  2016/07/07 7:54:24AM
 */

#include <stdio.h>
#include <string.h>

#define maxn 1010

/* const int maxn = 1010; */
/* in ANSI C 5.3.0 const in CAN NOT be used as array dimension.... */

int a[maxn], b[maxn];
int appe_1[10], appe_2[10];

int main(void) {
  #ifdef DEBUG
  freopen("in.txt", "r", stdin);
  #endif
  int n, cnt = 0;

  while (scanf("%d", &n) == 1 && n) {
    printf("Game %d:\n", ++cnt);
    int i, tmp_sum = 0, strong_num = 0, weak_num = 0;

    memset(appe_1, 0, sizeof(appe_1));
    for (i = 0; i < n; ++i) {
      scanf("%d", &a[i]);
      ++appe_1[a[i]];
    }

    for (tmp_sum = 0; ;) {
      strong_num = weak_num = tmp_sum = 0;
      memset(appe_2, 0, sizeof(appe_2));

      for (i = 0; i < n; ++i) {
        scanf("%d", &b[i]);
        if (b[i] == a[i]) ++strong_num;
        tmp_sum += b[i];
        ++appe_2[b[i]];
      }
      if (tmp_sum == 0) break;
      for (i = 1; i <= 9; ++i) {
        weak_num += (appe_1[i] < appe_2[i] ? appe_1[i] : appe_2[i]);
      }
      weak_num -= strong_num;
      printf("    (%d,%d)\n", strong_num, weak_num);
    }

  }
  return 0;
}
