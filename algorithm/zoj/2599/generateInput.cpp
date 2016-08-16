/*
 * =====================================================================================
 *
 *       Filename:  generateInput.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  08/16/2016 19:24:04
 *       Compiler:  g++
 *
 *         Author:  Sabastian (liuxueyang.github.io), read3valprintloop@gmail.com
 *
 * =====================================================================================
 */
#include <bits/stdc++.h>
using namespace std;
#define _ ios_base::sync_with_stdio(0);cin.tie(0);
#define rep(i, a, n) for (int i = a; i < n; ++i)
#define per(i, a, n) for (int i = n-1; i >= a; --i)
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
const ll MOD=1000000007;

int main ( void )
{_
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "w", stdout);
#endif     /* -----  ONLINE_JUDGE  ----- */
  rep(i,1,100){
    ll n=rand()%(ll)1e3;
    cout<<n<<" "<<rand()%(n-2)+1<<endl;
  }
  cout<<"0 0"<<endl;

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

