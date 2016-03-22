/*
 * =====================================================================================
 *       Filename : 3.cpp
 *    Description : C. Bear and Up-Down
 *    Version     : 
 *        Created : 03/21/16 16:43
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
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
int t[150000+10], n, result, m[150000+10];//, p[150000+10];
VI bad_index;

  int
is_good_index ( int index )
{
  if (index < 1 || index >= n) return 1;
  if ( index & 1 ) {                            /* odd index */
    return (t[index] < t[index + 1]);
  }
  else {
    return (t[index] > t[index + 1]);
  }
}		/* -----  end of function is_good_index  ----- */

  int
main ( int argc, char *argv[] )
{
#ifndef  ONLINE_JUDGE
freopen("3", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  
while ( ~scanf("%d", &n) ) {
  result = 0;
  bad_index.clear();
  rep(i, 1, n + 1) scanf ( "%d", t + i );
  rep(i, 1, n + 1) m[i] = 0;
  rep(i, 1, n + 1) if ( !is_good_index(i) ) m[i] = m[i + 1] = 1; /* m[i] == 1 if i is bad index */
  rep(i, 1, n + 1) if (m[i]) bad_index.pb(i);
  if (SZ(bad_index) > 6) {
    printf ( "0\n" );
    continue;
  }
  rep(i, 1, n + 1) {
    if (m[i]) {
      rep(j, 1, n + 1) {
        if (j > i || !m[j] ) {
          swap(t[j], t[i]);
          if (is_good_index(i) && is_good_index(i - 1) && 
              is_good_index(j) && is_good_index(j - 1) &&
              is_good_index(i + 1) && is_good_index(j + 1)) {
            rep(k, 0, SZ(bad_index)) {
              if (!is_good_index(bad_index[k])) goto next;
            }
            ++result;
          }
  //        printf ( "%d %d\n", j, bad_index[i] );
  next:
          swap(t[j], t[i]);
        }
      }
    }
  }
  printf ( "%d\n", result );
}

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

