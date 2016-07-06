#include <stdio.h>

int main(void) {
  long long n;
  long long cnt = 0;
  scanf("%lld", &n);
  while (1) {
    if (n & 1) {
      n = 3 * n + 1;
    } else {
      n /= 2;
    }
    ++cnt;
    if (n == 1) {
      break;
    }
  }
  printf("%lld\n", cnt);

  return 0;
}
