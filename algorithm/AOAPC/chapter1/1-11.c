#include <stdio.h>

int main(void) {
  int n, m, chicken, rabbit;

  scanf("%d%d", &n, &m);
  chicken = 2 * n - m / 2;
  rabbit = m / 2 - n;
  if (m % 2 != 0 || chicken < 0 || rabbit < 0) {
    printf("No answer\n");
  }
  else {
    printf("%d %d\n", chicken, rabbit);
  }
  return 0;
}
