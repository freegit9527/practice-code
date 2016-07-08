/*
  UVa 1587
  2016/07/07 9:26:12 PM
  THIS CODE IS SO BAD... REFER TO uva-1587-1.c
 */
#include <stdio.h>
#include <string.h>

/* num is the array to store unique numbers */
int visit[10000+10], num[10], a[6][2];
int point_numbers_cnt;

typedef struct Point {
  int w, h;
  int cnt;
  int is_square;
} Point;

/* store unique points */
Point point_num[10];

void swap(int *a, int *b) {
  int c;
  c = *a;
  *a = *b;
  *b = c;
}

void is_find_point(int w, int h) {
  /* if found, increase cnt; OR append it to the array and
     increase point_numbers_cnt */
  int found = 0;

  for (int i = 0; i < point_numbers_cnt; ++i) {
    if (w == point_num[i].w && h == point_num[i].h) {
      point_num[i].cnt++;
      found = 1;
      break;
    }
  }

  if (!found) {
    /* append it to the array */
    point_num[point_numbers_cnt].w = w;
    point_num[point_numbers_cnt].h = h;
    point_num[point_numbers_cnt].cnt = 1;
    point_num[point_numbers_cnt].is_square = (w == h ? 1 : 0);
    point_numbers_cnt++;
  }
}

void exchange_point(Point * x, Point * y) {
  Point tmp;

  tmp.w = (*x).w;
  tmp.h = (*x).h;
  tmp.is_square = (*x).is_square;

  (*x).w = (*y).w;
  (*x).h = (*y).h;
  (*x).is_square = (*y).is_square;

  (*y).w = (*x).w;
  (*y).h = (*x).h;
  (*y).is_square = (*x).is_square;

}

int main(void) {
  #ifdef DEBUG
  freopen("uva-1587-1.txt", "r", stdin);
  #endif

  int w, h;
  /* int kase = 0; */

  while (scanf("%d%d", &w, &h) != EOF) {
    /* printf("Case: %d: ", kase++); */
    /* int mark = 1; */

    /* numbers_cnt is the number of different numbers */
    int numbers_cnt = 0;
    /* point_numbers_cnt store the number of unique points */
    point_numbers_cnt = 0;

    /* visit is to remember the number of times of a number appears */
    memset(visit, 0, sizeof(visit));
    if (w > h) swap(&w, &h);

    a[0][0] = w;
    a[0][1] = h;

    is_find_point(w, h);

    /* insert w */
    visit[w]++;
    num[numbers_cnt++] = w;
    /* insert h */
    if (!visit[h]) {
      num[numbers_cnt++] = h;
    }
    visit[h]++;

    /* input other 5 data */
    for (int i = 1; i <= 5; ++i) {
      scanf("%d%d", &w, &h);
      if (w > h) swap(&w, &h);
      a[i][0] = w;
      a[i][1] = h;
      is_find_point(w, h);

      if (!visit[w]) {
        num[numbers_cnt++] = w;
      }
      visit[w]++;
      if (!visit[h]) {
        num[numbers_cnt++] = h;
      }
      visit[h]++;
    }

    /* print test */
    /* printf("numbers_cnt = %d\n", numbers_cnt); */
    /* for (int i = 0; i < numbers_cnt; ++i) { */
    /*   printf("%d ", num[i]); */
    /* } */
    /* printf("\n"); */

    if (numbers_cnt > 3 || point_numbers_cnt > 3) {
      printf("IMPOSSIBLE\n");
      continue;
    }

    if (numbers_cnt == 1) {
      printf("POSSIBLE\n");
      continue;
    }

    if (numbers_cnt == 2 && point_numbers_cnt == 2) {
        Point tp1, tp2;

        tp1.w = point_num[0].w;
        tp1.h = point_num[0].h;
        tp1.is_square = point_num[0].is_square;

        tp2.w = point_num[1].w;
        tp2.h = point_num[1].h;
        tp2.is_square = point_num[1].is_square;

        if (!tp1.is_square) {
          exchange_point(&tp1, &tp2);
        }

        /* now tp1 is square, tp2 is not.. */
        if (tp1.is_square && tp1.cnt == 4 &&
            tp2.cnt == 2 && !tp2.is_square && (tp1.w == tp2.w ||
                                               tp1.w == tp2.h)) {
          printf("POSSIBLE\n");
        } else {
          printf("IMPOSSIBLE\n");
        }
    }
    else if (numbers_cnt == 3 && point_numbers_cnt == 3 &&
             point_num[0].cnt == point_num[1].cnt && point_num[2].cnt == 2
             && point_num[0].cnt == 2) {
      /* ab ac bc we find that each two of them have common numbers */
      int a_ = point_num[0].w, b_;
      if (a_ == point_num[1].w) {
        b_ = point_num[1].h;
      } else {
        b_ = point_num[1].w;
      }
      /* a_ and b_ are different, it must be point_num[2] */
      if (a_ > b_) swap(&a_, &b_);
      if (point_num[2].w == a_ && point_num[2].h == b_) {
        printf("POSSIBLE\n");
      }
      else {
        printf("IMPOSSIBLE\n");
      }
    } else {
      printf("IMPOSSIBLE\n");
    }

    /* printf("%s\n", mark ? "POSSIBLE" : "IMPOSSIBLE"); */
  }

  return 0;
}
