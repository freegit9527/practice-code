/* Uva 401
   2016/07/07 7:37AM
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>

const char* message[] = {
  " -- is not a palindrome.",
  " -- is a regular palindrome.",
  " -- is a mirrored string.",
  " -- is a mirrored palindrome."
};

const char reverse_set[] = "A   3  HIL JM O   2TUVWXY51SE Z  8 ";
char s[30];

char mirror_char(char c) {
  if (isalpha(c)) {
    return reverse_set[c - 'A'];
  } else {
    return reverse_set[c - '0' + 25];
  }
}

int main(void) {
  #ifdef DEBUG
  freopen("in.txt", "r", stdin);
  #endif
  while (EOF != scanf("%s", s)) {
    int len = strlen(s), pali = 1, mir = 1, i;
    
    for (i = 0; i <= len / 2; ++i) {
      if (s[i] != s[len - 1 - i]) pali = 0;
      if (s[i] != mirror_char(s[len - 1 - i])) mir = 0;
    }
    printf("%s%s\n\n", s, message[pali + mir * 2]);
  }

  return 0;
}
