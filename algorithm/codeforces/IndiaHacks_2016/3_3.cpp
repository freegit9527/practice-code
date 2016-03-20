/*
 * =====================================================================================
 *       Filename : 3_3.cpp
 *    Description :
 *    Version     :
 *        Created : 03/20/16 21:51
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  :
 * =====================================================================================
 */

#include <cstdio>
#include <cstring>
#include <algorithm>
#include <iostream>
using namespace std;
const int P = 105;
const int Q = 1050;
const int N = 100500;
const int M = 1000500;
int n, m, p;
int xu[M];
int forbid[M];
int getint() {
  int res = 0;
  char ch = getchar();
  while ((ch < '0' || ch > '9') && ch != '-') ch = getchar();
  bool fan = 0;
  if (ch == '-') {
    fan = 1;
    ch = getchar();
  }
  while ('0' <= ch && ch <= '9') {
    res = res * 10 + ch - '0';
    ch = getchar();
  }
  if (fan) res = -res;
  return res;
}
bool Can(int x) {
  if (x < 1 || x >= n) return 1;
  if (x & 1) {
    if (xu[x] < xu[x + 1]) return 1;
    return 0;
  } else {
    if (xu[x] > xu[x + 1]) return 1;
    return 0;
  }
}
bool Find(int x, int y) {
  int i;
  if (x >= y) return 0;
  swap(xu[x], xu[y]);
  for (i = 1; i <= forbid[0]; i++) {
    if (!Can(forbid[i])) break;
  }
  if (i <= forbid[0]) {
    swap(xu[x], xu[y]);
    return 0;
  }
  bool res;
  if (Can(x) && Can(x - 1) && Can(y) && Can(y - 1))
    res = 1;
  else
    res = 0;
  swap(xu[x], xu[y]);
  return res;
}
int main() {
  int i, j;
  n = getint();
  for (i = 1; i <= n; i++) xu[i] = getint();
  for (i = 1; i < n; i++) {
    if (!Can(i)) forbid[++forbid[0]] = i;
  }
  int ans = 0;
  for (i = 1; i <= n; i++) {
    for (j = 1; j <= forbid[0]; j++) {
      if (forbid[j] != i && forbid[j] != i - 1) break;
    }
    if (j <= forbid[0]) {
      if (Find(i, forbid[j])) ans++;
      if (forbid[j] < n && Find(i, forbid[j] + 1)) ans++;
    } else {
      for (j = i + 1; j <= n; j++) {
        if (Find(i, j)) ans++;
      }
    }
  }
  printf("%d\n", ans);
  return 0;
}
