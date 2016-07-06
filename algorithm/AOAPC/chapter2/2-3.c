#include <stdio.h>

int main(void) {
  for (int i = 30; ; ++i) {
    int n = i * i;
    if (n > 9999) {
      break;
    }
    if (n < 1000) {
      continue;
    }
    int low = n % 100, high = n / 100;
    if ((low % 10 == low / 10) &&
        (high % 10 == high / 10)) {
      printf("%d\n", n);
    }
  }

  return 0;
}
