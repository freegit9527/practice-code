/*
 * =====================================================================================
 *       Filename : map.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/20/16 14:25
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
const ll mod=1000000007;


  int
main ( int argc, char *argv[] )
{
  MI a;
  a[1] = 1;
  a[2] = 2;
  if (a[1]) {
    printf ( "a = 1\n" );
  } 

  if ( a[2] == 2 ) {
    printf ( "a[2] = 2\n" );
  }

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

