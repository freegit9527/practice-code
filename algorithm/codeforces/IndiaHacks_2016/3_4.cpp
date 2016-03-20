/*
 * =====================================================================================
 *       Filename : 3_4.cpp
 *    Description :
 *    Version     :
 *        Created : 03/20/16 22:11
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  :
 * =====================================================================================
 */
#include <cstdio>
#include <cstring>
#include <cmath>
#include <algorithm>
#include <vector>
#include <string>
#include <set>
#include <map>
#include <queue>
#define mp make_pair
#define pb push_back
#define fir first
#define sec second
using namespace std;
typedef long long ll;

template <typename T>
inline void R(T &x) {
  char ch = getchar();
  x = 0;
  for (; ch < '0' || ch > '9'; ch = getchar())
    ;
  for (; ch <= '9' && ch >= '0'; ch = getchar()) x = x * 10 + ch - '0';
}
const int N = 150005;
int n, a[N], s[N];
vector<int> pos;
set<pair<int, int>> S;
int check() {
  pos.clear();
  int res = 0;
  for (int i = 1; i < n; ++i) {
    s[i] = 1;
    if (i & 1) {
      if (!(a[i] < a[i + 1])) res++, pos.pb(i), pos.pb(i + 1), s[i] = 0;
    } else {
      if (!(a[i] > a[i + 1])) res++, pos.pb(i), pos.pb(i + 1), s[i] = 0;
    }
  }
  return res;
}
bool qcheck(int l, int r) {
  if (l < 1) l = 1;
  if (r > n) r = n;
  if (l >= r) return 1;
  return s[r - 1] - s[l - 1] == r - l;
}
bool pcheck(int i) {
  // check i, i+1
  if (i <= 0 || i >= n) return 1;
  if (i & 1) {
    if (!(a[i] < a[i + 1])) return 0;
  } else {
    if (!(a[i] > a[i + 1])) return 0;
  }
  return 1;
}
int main() {
  R(n);
  for (int i = 1; i <= n; ++i) R(a[i]);
  int type = check();
  if (type > 4) {
    puts("0");
    return 0;
  }
  for (int i = 1; i <= n; ++i) s[i] += s[i - 1];
  for (int i : pos) {
    for (int j = 1; j < i; ++j) {
      swap(a[i], a[j]);
      if (qcheck(1, j - 1) && qcheck(j + 1, i - 1) && qcheck(i + 1, n) &&
          pcheck(i - 1) && pcheck(i) && pcheck(j - 1) && pcheck(j))
        S.insert(mp(j, i));
      swap(a[i], a[j]);
    }
    for (int j = i + 1; j <= n; ++j) {
      swap(a[i], a[j]);
      if (qcheck(1, i - 1) && qcheck(i + 1, j - 1) && qcheck(j + 1, n) &&
          pcheck(i - 1) && pcheck(i) && pcheck(j - 1) && pcheck(j))
        S.insert(mp(i, j));
      swap(a[i], a[j]);
    }
  }
  printf("%d\n", (int)S.size());
  return 0;
}
