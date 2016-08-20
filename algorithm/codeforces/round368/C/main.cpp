/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  [>0;95;0c]
 *
 *        Version:  1.0
 *        Created:  08/20/2016 22:00:40
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
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  ll n;
  while(cin>>n){
    ll m,k;
    if(n&1){
      m=(n+1)/2;
      k=n-m;
      ll ans1=2*m*k,ans2=m*m+k*k;
      if(!ans1||!ans2){
        cout<<-1<<endl;
      }
      else{
        cout<<2*m*k<<" "<<m*m+k*k<<endl;
      }
    }
    else{
      n/=2;
      ll ans1=n*n-1,ans2=n*n+1;
      if(!ans1||!ans2){
        cout<<-1<<endl;
      }
      else{
        cout<<n*n-1<<" "<<n*n+1<<endl;
      }
    }
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

