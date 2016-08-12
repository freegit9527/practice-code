/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  http://www.spoj.com/problems/DIEHARD/
 *
 *        Version:  2.0
 *        Created:  08/12/2016 20:50:32
 *       Compiler:  g++
 *
 *         Author:  Sabastian (liuxueyang.github.io), liuxueyang457@gmail.com
 *
 * =====================================================================================
 */
#include <bits/stdc++.h>
#include <cstdio>
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
const int N=1020;
ll sum[N][N];
ll solve(int h,int a){
  if(h<=0||a<=0)return -1;
  if(-1!=sum[h][a])return sum[h][a];
  ll a2=solve(h-2,a-8), a3=solve(h-17,a+7);
  return sum[h][a]=2+max(a2,a3);
}
  int
main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  int T,h,a;cin>>T;while(T--){
    memset(sum,-1,sizeof(sum));
    cin>>h>>a;cout<<solve(h,a)<<endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

