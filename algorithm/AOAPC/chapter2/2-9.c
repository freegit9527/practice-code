#include <stdio.h>

int main(void) {

  int cnt = 0, min_num = 0, max_num = 0, n, first_num = 0;
  double ave_num = 0, sum = 0;
  while (scanf("%d", &n) == 1) {
    sum += n;
    if (first_num == 0) {
      min_num = max_num = n;
      ++first_num;
    }
    if (min_num > n) {
      min_num = n;
    }
    if (max_num < n) {
      max_num = n;
    }
    ++cnt;
  }
  ave_num = sum / cnt;
  printf("%d %d %.3f\n", min_num, max_num, ave_num);

  return 0;
}
