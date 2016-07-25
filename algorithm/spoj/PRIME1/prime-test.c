#include <stdio.h>
#include <time.h>

int isprime(int n) {
  for (int i = 2; i * i <= n; ++i) {
    if (n % i == 0) return 0;
  }

  return 1;
}

int main(void) {
  int j = 0;
  for (int i = 2; i <= 1000 * 1000 * 10; ++i) {
    if (isprime(i)) {
      ++j;
      /* printf("%d ", i); */
    }
  }

  printf("\nj = %d\n", j);
  printf("%.2f\n", (double)clock() / CLOCKS_PER_SEC);

  return 0;
}
