#include <stdio.h>
#include <string.h>
#include <time.h>
#include <math.h>

#define MAXN ((int)1e8 + 1)
#define SEGN ((int)(1e9) + 1)

int a[SEGN];
int b[SEGN];

int main(void)
{
  int j, i;

  memset(a, 0, sizeof(a));
  memset(b, 0, sizeof(b));

  /* first segment */
  for (i = 3; i * i <= SEGN; i += 2) {
    /* 0 represents i is a prime number */
    if (0 == a[i]) {
      for (int k = i * i; k <= SEGN; k += 2 * i) {
        a[k] = 1;
      }
    }
  }

  b[0] = 2;
  j = 1;

  for (i = 3; i < SEGN; i += 2) {
    if (0 == a[i]) {
      b[j++] = i;
    }
  }

  printf("j = %d\n", j);
  /* for (i = 0; i < j; ++i) { */
  /*   printf("%d ", b[i]); */
  /* } */
  /* printf("\n"); */

  printf("%.2f\n", (double)clock() / CLOCKS_PER_SEC);

	return 0;
}
