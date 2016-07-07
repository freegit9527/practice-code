/* UVa 110082 */
#include <stdio.h>
#include <string.h>

const char char_set[] = "`1234567890-=QWERTYUIOP[]\\ASDFGHJKL;'ZXCVBNM,./'";

int main(void) {
  #ifdef DEBUG
  freopen("in.txt", "r", stdin);
  #endif
  char ch;
  char * occur;
  while ((ch = getchar()) != EOF) {
    /* printf("ch = %c", ch); */
    if (NULL != (occur = strchr(char_set, ch))) {
      printf("%c", char_set[occur - char_set - 1]);
    } else {
      printf("%c", ch);
    }
  }

  return 0;
}
