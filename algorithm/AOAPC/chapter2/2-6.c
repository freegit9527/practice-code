#include <stdio.h>

int main(void) {
  double least = 1e-6;
  int i = 1, cnt = 0;
  double sum = 0, item;

  while (1) {
    item = 1.0 / i;
    if (cnt % 2 == 0) {
      sum += item;
    } else {
      sum -= item;
    }
    i += 2;
    ++cnt;
    if (item < least) {
      break;
    }
  }
  printf("%.6f\n", sum);

  return 0;
}
