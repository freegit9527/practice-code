/* Uva 272 */
#include <stdio.h>

int main(void) {
  #ifdef DEBUG
  freopen("in.txt", "r", stdin);
  #endif
  char c;
  int cnt = 1;
  while ((c = getchar()) != EOF) {
      if (c == '"') {
        printf("%s", cnt ? "``" : "''");
        /* if (cnt & 1) { */
        /*   printf("``"); */
        /* } */
        /* else { */
        /*   printf("''"); */
        /* } */
        cnt = !cnt;
        /* do not use ++cnt... */
      }
      else {
        printf("%c", c);
      }
    }

  return 0;
}
