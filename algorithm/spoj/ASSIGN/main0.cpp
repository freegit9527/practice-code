/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  http://www.spoj.com/problems/ASSIGN/
 *    Run Time Error.
 *
 *        Version:  1.0
 *        Created:  08/13/2016 13:03:45
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
const int N=((1<<20)+10);
ll a[25][N];
int b[25][25];
ll result;
int n;

ll solve(int stu, ll mask){
  if(a[stu][mask])return a[stu][mask];
  if(stu>=n+1)return a[stu][mask]=1;
  ll result=0;rep(j,0,n){
    if( b[stu-1][j]==1 && !((1<<j)&mask) )
      result+=solve(stu+1,mask|(1<<j));
  }
  return a[stu][mask]=result;
}

int main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  int T;cin>>T;while(T--){
    memset(a,0,sizeof(a)); cin>>n;rep(i,0,n)rep(j,0,n)cin>>b[i][j];
    cout<<solve(1,0)<<endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

