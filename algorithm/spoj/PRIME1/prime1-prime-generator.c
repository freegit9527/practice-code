#include <stdio.h>
#include <string.h>
#include <time.h>
#include <math.h>

#define MAXN ((int)1e9)
#define SEGN ((int)1e6)

int a[SEGN];
int b[SEGN];

int m, n;

int main(void)
{
  #ifdef DEBUG
  freopen("prime1-prime-generator.txt", "r", stdin);
  #endif
  int j, i;
  int t;
  scanf("%d", &t);
  while (t--) {
    scanf("%d%d", &m, &n);

    memset(a, 0, sizeof(a));
    memset(b, 0, sizeof(b));

    /* printf("m = %d, n = %d\n", m, n); */
    /* first segment */
    for (i = 3; i * i <= (int)sqrt(n); i += 2) {
      /* 0 represents i is a prime number */
      if (0 == a[i]) {
        for (int k = i * i; k <= (int)sqrt(n); k += 2 * i) {
          a[k] = 1;
        }
      }
    }

    b[0] = 2;
    j = 1;

    for (i = 3; i <= (int)sqrt(n); i += 2) {
      if (0 == a[i]) {
        b[j++] = i;
      }
    }

    /* printf("first: n = %d, j = %d\n", n, j); */
    /*
      1 .. sqrt n
      sqrt n + 1 ... 2 * sqrt
    */
    for (int seg_n = 1; seg_n <= (int)sqrt(n) - 1; ++seg_n) {
      /* printf("seg_n = %d, j = %d ", seg_n, j); */
      memset(a, 0, sizeof(a));

      int start_n = seg_n * (int)sqrt(n) + 1,
        end_n = (seg_n + 1) * (int)sqrt(n),
        base = seg_n * (int)sqrt(n);

      if (seg_n == (int)sqrt(n) - 1) end_n = n;

      /* printf("start_n = %d, end_n = %d, base = %d\n", start_n, end_n, base); */
      for (i = 0; i < j; ++i) {
        for (int k = start_n; k <= end_n; ++k) {
          if (k % b[i] == 0) {
            a[k - base] = 1;
          }
        }
      }

      /* for (i = start_n; i * i <= end_n; ++i) { */
      /*   if (0 == a[i - base]) { */
      /*     for (int k = i * i; k <= end_n; k += i) { */
      /*       ; */
      /*     } */
      /*   } */
      /* } */

      /* for (i = start_n; i * i <= end_n; ++i) { */
      /*   if (!a[i - base]) { */
      /*     for (int k = i * i; k <= end_n; k += i) { */
      /*       a[k - base] = 1; */
      /*     } */
      /*   } */
      /* } */

      for (i = start_n; i <= end_n; ++i) {
        if (0 == a[i - base]) {
          b[j++] = i;
        }
      }
    }


    /* test print */
    for (i = 0; i < j; ++i) {
      if (b[i] >= m && b[i] <= n)
        printf("%d\n", b[i]);
    }
    /* printf("\n"); */
    /* printf("j = %d\n", j); */

    /* printf("%.2f\n", (double)clock() / CLOCKS_PER_SEC); */
    if (t) printf("\n");
  }

	return 0;
}
