/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  http://www.spoj.com/problems/DIEHARD/
 *
 *        Version:  1.0
 *        Created:  08/12/2016 20:04:27
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
ll sum[N][N][4];
ll solve(int h,int a,int pos){
  if(h<=0||a<=0)return 0;
  if(-1!=sum[h][a][pos])return sum[h][a][pos];
  ll a1,a2,a3;
  if(pos==1){
    a2=solve(h-5,a-10,2);
    a3=solve(h-20,a+5,3);
    return sum[h][a][pos]=1+max(a2,a3);
  } else if(pos==2) {
    a1=solve(h+3,a+2,1);
    a3=solve(h-20,a+5,3);
    return sum[h][a][pos]=1+max(a1,a3);
  } else {
    a1=solve(h+3,a+2,1);
    a2=solve(h-5,a-10,2);
    return sum[h][a][pos]=1+max(a1,a2);
  }
}
  int
main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  int T,h,a;cin>>T;while(T--){
    memset(sum,-1,sizeof(sum));
    cin>>h>>a;
    ll a1=solve(h,a,1),a2=solve(h,a,2),a3=solve(h,a,3);
    cout<<max(a1,max(a2,a3))-1<<endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

