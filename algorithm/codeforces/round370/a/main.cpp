/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2016/09/12 01时43分24秒
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
const int N=(int)(1e5+10);
ll a[N],b[N];
int n;

int main ( void )
{
  _
#ifndef  ONLINE_JUDGE
    freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  while(cin>>n){
    rep(i,1,n+1)cin>>a[i];
    memset(b,0,sizeof(b));
    b[n]=a[n];
    per(i,1,n){
      b[i]=a[i]+a[i+1];
    }
    rep(i,1,n+1)cout<<b[i]<<' ';
    cout<<endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

