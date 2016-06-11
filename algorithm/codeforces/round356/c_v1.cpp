/*
 * =====================================================================================
 *
 *       Filename:  c.cpp
 *
 *    Description:  
 *
 *        Version:  1.1
 *        Created:  06/10/2016 08:57:54 PM
 *       Compiler:  g++
 *
 *         Author:  Sabastian (liuxueyang.github.io), liuxueyang457@gmail.com
 *
 * =====================================================================================
 */
#include <bits/stdc++.h>
using namespace std;
#define _ ios_base::sync_with_stdio(0);cin.tie(0);
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
bool isPrime(int n) {

  for ( int i = 2; i * i <= n; ++i) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

bool isDivisible(int n) {
  string str;
  printf ( "%d\n", n );
  fflush(stdout);
  cin >> str;
  return str == "yes";
}

int a[50];
  int
main ( void )
{
#ifndef  ONLINE_JUDGE
//  freopen("c.in", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  int j = 0;
  rep(i, 2, 51) {
    if (isPrime(i)) {
      a[j] = i;
      ++j;
    }
  }
  rep(i, 0, j) {
    printf ( "%d ", a[i] );
  }
  printf ( "\n" );
  // j is len
  // a. 2, 3, 5, 7 -> ... 
  // b. primes less than 50

  string str;
  int cnt = 0;
  rep (i, 0, j) {
    if ( isDivisible(a[i]) ) {
      ++cnt;
      if ( cnt >= 2 ) {
        printf ( "composite\n" );
        fflush(stdout);
        return EXIT_SUCCESS;
      }
      if ( a[i] <= 7 && isDivisible(a[i] * a[i])) {
        ++cnt;
      }
      if ( cnt >= 2 ) {
        printf ( "composite\n" );
        fflush(stdout);
        return EXIT_SUCCESS;
      }
    }
  }
  printf ( "prime\n" );
  fflush(stdout);

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

