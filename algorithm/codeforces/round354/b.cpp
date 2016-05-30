/*
 * =====================================================================================
 *       Filename : b.cpp
 *    Description : 
 *    Version     : 
 *        Created : 05/30/16 22:46
 *         Author : Liu Xue Yang (Lpaste), liuxueyang457@163.com
 *         Motto  : 
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
#define per(i, a, n) for (int i = n-1; i > a; --i)
#define pb push_back
#define mp make_pair
#define all(x) (x).begin(),(x).end()
#define fi first
#define se second
#define SZ(x) ((int)(x).size())
typedef vector<int> VI;
typedef map<int,int> MI;
typedef long long ll;
typedef pair<int,int> PII;
//const ll mod=1000000007;
char str[100000+10];
int n, k;
int solve (char ch) {
    int i, j, max_len = 0, k1 = k, tmp_len = 0;
    i = j = 0;

    while (1) {
      while (1) {
        if (j >= n) break;

        if (str[j] != ch) {
          if (k1 > 0) k1--;
          else break;
        } 

        tmp_len++;

        if (tmp_len > max_len) {
          max_len = tmp_len;
        }

        ++j;
      }

      if (str[i] != ch) {
        k1++;
      }

      ++i;
      tmp_len--;

      if (j >= n) break;
    }

    return max_len;
}
  int
main ( int argc, char *argv[] )
{
#ifndef  ONLINE_JUDGE
freopen("b.in", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  

  while ( ~scanf("%d%d", &n, &k) ) {
    scanf("%s", str);
    int res1 = solve('a');
    int res2 = solve('b');
    if (res1 > res2) {
      printf ( "%d\n", res1 );
    } else {
      printf ( "%d\n", res2 );
    }
  }

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

