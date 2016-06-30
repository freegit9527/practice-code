//#include <bits/stdc++.h> #TODO Spacemacs找不到这个文件
//#include <cstdin> #TODO 找不到这个文件

#include <iostream>

using namespace std;

typedef struct P { int x, y; } P;
typedef struct Q { int x, y, position; } Q;

P p[100];
Q q[100]; // 离散化辅助数组

int n;

int cmp(Q a, Q b) { return a.y < b.y; }
int cmp1(P a, P b) { return a.x < b.x; }

int main(void) {
  freopen("input.txt", "r", stdin);
  int i;
  scanf("%d", &n);

  // y离散化
  for (i = 1; i <= n; ++i) {
    scanf("%d%d", &p[i].x, &p[i].y);
    q[i].x = p[i].x;
    q[i].y = p[i].y;
    q[i].position = i;
  }

  sort(q + 1, q + 1 + n, cmp);

  for (i = 1; i <= n; ++i) {
    p[q[i].position].y = i;
  }

  // x 排序
  sort(p + 1, p + 1 + n, cmp1);

  // 输出
  for (int i = 1; i <= n; ++i) {
    printf("(%d, %d) ", p[i].x, p[i].y);
  }
  printf("\n");

  return 0;
}
