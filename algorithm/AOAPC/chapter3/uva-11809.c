/*
  UVa 11809
  2016/07/08 02:01:32 PM
 */

#include <stdio.h>
#include <math.h>
#include <string.h>

char a[500][30], buff[30];

int main(void) {
  for (int mm = 0; mm <= 9; ++mm) {
    for (int ee = 1; ee <= 30; ++ee) {
      long double sum = 0;

      /* M + 1 */
      for (int i = 1; i <= mm + 1; ++i) {
        sum += pow(1.0/2, i);
      }
      /* E */
      sum *= pow(2, pow(2, ee) - 1);

      sprintf(buff, "%.15Le", sum);
      printf("%s\n", buff);
    }
  }

  return 0;
}
