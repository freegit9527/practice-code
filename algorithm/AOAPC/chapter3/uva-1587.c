/*
  UVa 1587
  2016/07/07 9:26:12 PM
 */
#include <stdio.h>
#include <string.h>

int visit[10000+10], num[3], a[6][2];

void swap(int *a, int *b) {
  int c;
  c = *a;
  *a = *b;
  *b = c;
}

int main(void) {
  #ifdef DEBUG
  freopen("uva-1587.txt", "r", stdin);
  #endif

  int w, h;

  while (scanf("%d%d", &w, &h) != EOF) {
    int mark = 1;
    memset(visit, 0, sizeof(visit));

    int equal_cnt = 0, all_cnt = 0;

    if (w > h) {
      swap(&w, &h);
      visit[w]++; visit[h]++;
      num[all_cnt++] = w;
      num[all_cnt++] = h;
    }
    else if (w == h) {
      ++equal_cnt;
      visit[w]++;
      num[all_cnt++] = w;
    } else {
      visit[w]++; visit[h]++;
      num[all_cnt++] = w;
      num[all_cnt++] = h;
    }

    a[0][0] = w; a[0][1] = h;

    for (int i = 1; i <= 5; ++i) {
      scanf("%d%d", &w, &h);
      if (w > h) {
        swap(&w, &h);
        if (!visit[w]) { num[all_cnt++] = w; }
        if (!visit[h]) num[all_cnt++] = h;
        visit[w]++; visit[h]++;
      } else if (w == h) {
        ++equal_cnt;
      }
      a[i][0] = w; a[i][1] = h;
    }

    for (int i = 0; i < 6; ++i) {
      
    }

    printf("%s\n", mark ? "POSSIBLE" : "IMPOSSIBLE");
  }

  return 0;
}
