/*
  UVa 1586
  2016/07/07 10:56:11 AM
 */
#include <stdio.h>
#include <string.h>
#include <ctype.h>

char a[100];

int main(void) {
  #ifdef DEBUG
  freopen("uva-1586.txt", "r", stdin);
  #endif

  int T; scanf("%d", &T);

  while (T--) {
    scanf("%s", a);
    int len = strlen(a);
    double sum = 0, C = 12.01, H = 1.008, O = 16.00, N = 14.01;
    int i, tmp_num = 0, num = 0;
    char c;
    double cur_w = 0;

    for (i = 0; i < len; ++i) {
      c = a[i];
      if (isalpha(c)) {
        if (num) {
          num = 0;
        }
        sum += cur_w * tmp_num;
        if (c == 'C') {
          cur_w = C;
        } else if (c == 'H') {
          cur_w = H;
        } else if (c == 'O') {
          cur_w = O;
        } else {
          cur_w = N;
        }
        tmp_num = 1;
      } else {
        num = num * 10 + c - '0';
        tmp_num = num;
      }
    }
    sum += cur_w * tmp_num;
    printf("%.3f\n", sum);
  }
  return 0;
}
