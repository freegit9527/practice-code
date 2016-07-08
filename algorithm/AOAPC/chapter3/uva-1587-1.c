/*
  Uva 1587
  2016/07/08 09:01:03 AM
 */

#include <stdio.h>
#include <stdlib.h>

typedef struct Point {
  int w, h;
} Point;

void swap(int *a, int *b) {
  int c;
  c = *a;
  *a = *b;
  *b = c;
}

int compare_point(const void * a, const void * b) {
  if ((*(Point*)a).w == (*(Point*)b).w)
    return (*(Point*)a).h - (*(Point*)b).h;
  else return (*(Point*)a).w - (*(Point*)b).w;
}

Point a[10];

int main(void) {
  #ifdef DEBUG
  freopen("uva-1587-1.txt", "r", stdin);
  #endif

  while (scanf("%d%d", &a[0].w, &a[0].h) != EOF) {
    if (a[0].w > a[0].h) swap(&a[0].w, &a[0].h);
    for (int i = 1; i <= 5; ++i) {
      scanf("%d%d", &a[i].w, &a[i].h);
      if (a[i].w > a[i].h) swap(&a[i].w, &a[i].h);
    }
    qsort(a, 6, sizeof(Point), compare_point);

    /* print test */
    /* for (int i = 0; i < 6; ++i) { */
    /*   printf("(%d, %d) ", a[i].w, a[i].h); */
    /* } */
    /* printf("\n"); */

    int mark = 1;

    for (int i = 0; i < 6; i += 2) {
      if (a[i].w != a[i + 1].w || a[i].h != a[i + 1].h) {
        mark = 0; break;
      }
    }

    if (a[0].w != a[2].w || a[0].h != a[4].w || a[2].h != a[4].h)
      mark = 0;

    puts(mark ? "POSSIBLE" : "IMPOSSIBLE");
  }

  return 0;
}
