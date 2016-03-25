/*
 * =====================================================================================
 *       Filename : b.cpp
 *    Description : B Problem
 *    Version     : 
 *        Created : 03/25/16 21:35
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
int n, a[1000+10];
  int
main ( int argc, char *argv[] )
{
#ifndef  ONLINE_JUDGE
freopen("b", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  
  
while ( ~scanf ( "%d", &n ) ) {
  rep(i, 0, n) scanf ( "%d", a + i );
  sort(a, a + n);
  if ( n & 1 ) {                                /* n is odd */
    int odd_end = n / 2;
    int even_start = odd_end + 1;
    int i = 0, j = even_start;
    while ( i <= odd_end && j < n ) {
      printf ( "%d %d ", a[i], a[j] );
      i++; j++;
    }
    printf ( "%d\n", a[i] );
  }
  else {
    int odd_end = n / 2 - 1;
    int even_start = odd_end + 1;
    int i = 0, j = even_start;
    while ( i <= odd_end && j < n ) {
      printf ( "%d %d ", a[i], a[j] );
      i++; j++;
    }
    printf ( "\n" );
  }
}

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

