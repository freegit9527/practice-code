#include <stdio.h>

int main(void) {
  int n, case_num = 0;
  while (scanf("%d", &n) == 1 && n) {
    int tmp, max_num, min_num;
    double ave_num, sum = 0;
    for (int i = 0; i < n; ++i) {
      scanf("%d", &tmp);
      if (i == 0) {
        max_num = min_num = tmp;
      }
      if (max_num < tmp) max_num = tmp;
      if (min_num > tmp) min_num = tmp;
      sum += tmp;
    }
    ave_num = sum / n;
    if (case_num) printf("\n"); // I forget this. there is a
                                // blank line between the cases.
                                // but after the last case, there
                                // is not blank line...
    printf("Case %d: %d %d %.3f\n", ++case_num, min_num, max_num, ave_num);
  }

  return 0;
}
