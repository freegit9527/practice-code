/*
  UVa 1368
  2016/07/07 04:00:34 PM
  找每列里面出现最多的
 */

#include <stdio.h>

char a[55][1010];
char b[1010];

int main(void) {
  #ifdef DEBUG
  freopen("uva-1368.txt", "r", stdin);
  #endif

  int T; scanf("%d", &T);
  while (T--) {
    int n, m; scanf("%d%d", &m, &n);

    for (int i = 0; i < m; ++i) {
      scanf("%s", a[i]);
    }

    int ans = 0;
    for (int j = 0; j < n; ++j) {
      int cnta = 0, cntt = 0, cntc = 0, cntg = 0;
      for (int i = 0; i < m; ++i){
        if (a[i][j] == 'A') ++cnta;
        else if (a[i][j] == 'T') ++cntt;
        else if (a[i][j] == 'C') ++cntc;
        else ++cntg;
      }
      int cnt_max = cnta > cntc ? cnta : cntc;
      cnt_max = cnt_max > cntg ? cnt_max : cntg;
      cnt_max = cnt_max > cntt ? cnt_max : cntt;
      if (cnt_max == cnta) b[j] = 'A';
      else if (cnt_max == cntc) b[j] = 'C';
      else if (cnt_max == cntg) b[j] = 'G';
      else b[j] = 'T';
      ans += (m - cnt_max);
    }

    for (int i = 0; i < n; ++i) printf("%c", b[i]);
    printf("\n%d\n", ans);
  }
  return 0;
}
