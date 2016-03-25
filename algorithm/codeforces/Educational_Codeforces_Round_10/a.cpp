/*
 * =====================================================================================
 *       Filename : a.cpp
 *    Description : A Problem
 *    Version     : 
 *        Created : 03/25/16 21:22
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
int h1, h2, a, b, cnt;
  int
main ( int argc, char *argv[] )
{
#ifndef  ONLINE_JUDGE
freopen("1", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  
  while (~scanf("%d%d", &h1, &h2)) {
    scanf ( "%d%d", &a, &b );
    if ( a <= b ) {
      
      if ( h1 + 8 * a >= h2 ) {
        printf ( "0\n" );
      }
      else {
        printf ( "-1\n" );
      }
    }
    else {
      
      if ( h1 + 8 * a >= h2 ) {
        printf ( "0\n" );
      }
      else {
        cnt = 1;
        int s1 = h1 + 8 * a - 12 * b;
        while (true) {
          if ( s1 + 12 * a >= h2 ) {
            break;
          }
          s1 = s1 + 12 * (a - b);
          ++cnt;
        }
        printf ( "%d\n", cnt );
      }
    }
  }

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

