/*
  Uva 202 - Repeating Decimals
  2016/07/07 05:03:31 PM
 */
#include <stdio.h>
#include <string.h>
#include <math.h>

int visit[3030], decimals[3030*3], lookup_decimal[3030];
char result[3030*3];

int main(void) {
  #ifdef DEBUG
  freopen("uva-202.txt", "r", stdin);
  #endif

  int a, b;
  while (scanf("%d%d", &a, &b) != EOF) {
    printf("%d/%d = %d.", a, b, a / b);
    memset(visit, 0, sizeof(visit));
    memset(result, 0, sizeof(result));
    memset(decimals, 0, sizeof(decimals));
    memset(lookup_decimal, 0, sizeof(lookup_decimal));

    int rem = a % b, cnt = 0;
    a = rem * 10;

    while (rem && !visit[rem]) {
      ++visit[rem];
      decimals[cnt] = a / b;
      lookup_decimal[rem] = cnt;
      rem = a % b;
      a = rem * 10;
      ++cnt;
    }

    int start_n = 0;
    int cycle_num = 0;
    if (rem != 0) {
      start_n = lookup_decimal[rem];
      cycle_num = cnt - start_n;

      for (int i = 0; i < cnt; ++i) {
        if (i == start_n) {
          printf("(");
          while (i < cnt) {
            char tmp_char[10];
            sprintf(tmp_char, "%d", decimals[i]);
            strcat(result, tmp_char);
            /* printf("result = %s\n", result); */
            if (strlen(result) > 55) break;
            ++i;
          }
          if (strlen(result) > 50) {
            result[50] = result[51] = result[52] = '.';
            result[53] = '\0';
          }
          break;
        }
        printf("%d", decimals[i]);
      }
      printf("%s", result);
      printf(")");
    } else {
      cycle_num = 1;
      for (int i = 0; i < cnt; ++i) {
        printf("%d", decimals[i]);
      }
      printf("(0)");
    }
    printf("\n   %d = number of digits in repeating cycle\n", cycle_num);

    printf("\n");
  }

  return 0;
}
