/*
 * =====================================================================================
 *       Filename : 3.cpp
 *    Description : C. Bear and Up-Down
 *    Version     :
 *        Created : 03/20/16 12:52
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */

#include <cstdio>
#include <cstring>
#include <algorithm>
#include <vector>
#include <string>
#include <map>
#include <set>
#include <cassert>
using namespace std;
#define rep(i, a, n) for (int i = a; i < n; ++i)
#define per(i, a, n) for (int i = n - 1; i > a; --i)
#define pb push_back
#define mp make_pair
#define all(x) (x).begin(), (x).end()
#define fi first
#define se second
#define SZ(x) ((int)(x).size())
typedef vector<int> VI;
typedef map<int, int> MI;
typedef long long ll;
typedef pair<int, int> PII;
// const ll mod=1000000007;

int n, t[150000+10];                            /* MUST BIGGER THAN 150000!!!!! */
VI bad_index;
MI used_bad_index;
int is_good_index(int index) {
  if (index < 1 || index > n) {
    return 1;
  }
  if (index % 2 == 0) {
    return ((t[index] > t[index - 1]) && (index == n || t[index] > t[index + 1]));
  } else {
    return ((index == 1 || t[index] < t[index - 1]) && (index == n || t[index] < t[index + 1]));
  }
} /* -----  end of function is_bad_index  ----- */
int swap_bad_and_other(int i, int j) {
  swap(t[i], t[j]);
  int mark = 1;

  if (is_good_index(i) && is_good_index(j) && is_good_index(i - 1) &&
      is_good_index(j - 1) && is_good_index(i + 1) && is_good_index(j + 1)) {
    rep(i, 0, SZ(bad_index)) if (!is_good_index(bad_index[i])) {
      mark = 0;
      break;
    }
  } else {
    mark = 0;
  }
  swap(t[i], t[j]);
  return mark;
} /* -----  end of function swap_bad_and_other  ----- */
int main(int argc, char *argv[]) {
#ifndef ONLINE_JUDGE
  freopen("3", "r", stdin);
#endif /* -----  ONLINE_JUDGE  ----- */

  while (~scanf("%d", &n)) {
    bad_index.clear();
    used_bad_index.clear();
    for (int i = 1; i <= n; ++i) {
      scanf("%d", t + i);
    }
    for (int i = 1; i <= n; ++i) {
      if (!is_good_index(i)) {
        bad_index.pb(i);
      }
    }
    int result = 0;

    if (SZ(bad_index) > 10) {
      printf("0\n");
    } else {
      for (int j = 0; j < SZ(bad_index); ++j) {
        for (int i = 1; i <= n; ++i) {
          if (!(used_bad_index[i] == 1)) {
            if (swap_bad_and_other(i, bad_index[j])) {
              ++result;
            }
          }
        }
        used_bad_index[bad_index[j]] = 1;
      }
      printf("%d\n", result);
    }
  }

  return EXIT_SUCCESS;
} /* ----------  end of function main  ---------- */
