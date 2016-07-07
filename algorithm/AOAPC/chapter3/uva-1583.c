/*
  UVa 1583 - Digit Generator
  2016/07/07 09:30:00AM
 */
#include <stdio.h>
#include <math.h>

#define MAXN 100010

int ans_table[MAXN];

int main(void) {
  #ifdef DEBUG
  freopen("in.txt", "r", stdin);
  #endif

  int i;

  /* get table from 1 to MAXN */
  for (i = 1; i < MAXN; ++i) {
    int x = i, sum = i;
    while (x) {
      sum += x % 10;
      x /= 10;
    }
    if (!ans_table[sum]) {
      ans_table[sum] = i;
    }
  }

  int T;
  scanf("%d", &T);
  while (T--) {
    int n;
    scanf("%d", &n);
    printf("%d\n", ans_table[n]);
    /* n <= 100,000 */

    /* int lowest_n = n - 9 * ((int)log10(n) + 1); */
    /* lowest_n = lowest_n < 0 ? 0 : lowest_n; */
    /* int i, ans = 0; */
    /* for (i = lowest_n; i < n; ++i) { */
    /*   int tmp = i, sum = i; */
    /*   while (tmp) { */
    /*     sum += tmp % 10; */
    /*     tmp /= 10; */
    /*   } */
    /*   if (sum == n) { */
    /*     ans = i; */
    /*     break; */
    /*   } */
    /* } */
    /* printf("%d\n", ans); */
  }
  return 0;
}
