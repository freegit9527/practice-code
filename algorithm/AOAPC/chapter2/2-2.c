#include <stdio.h>
#include <math.h>

int main(void) {
  int n;

  for (int i = 1; i <= 9; ++i) {
    for (int j = 0; j <= 9; ++j) {
      n = j * 11 + i * 1100;
      int m = (int)sqrt(n);
      if (m * m == n) {
        printf("%d\n", n);
      }
    }
  }
  return 0;
}
