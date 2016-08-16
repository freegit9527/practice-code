/*
 * =====================================================================================
 *
 *       Filename:  check.cpp
 *
 *    Description:  brute force
 *
 *        Version:  1.0
 *        Created:  08/16/2016 19:31:32
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
ll N,K;
int a[(int)1e3+10];
int digitSum(int n){
  int ans=0;while(n){
    ans+=n%10;n/=10;
  }
  return ans;
}
int main ( void )
{_
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
  freopen("output.txt", "w", stdout);
#endif     /* -----  ONLINE_JUDGE  ----- */
  /* 
   * test range is just 1000!!!
   * */
  while(cin>>N>>K){
    if(!N&&!K)break;
    rep(i,1,N+1)a[i]=i;
    sort(a+1,a+N+1,[](const int&a,const int&b){
        int da=digitSum(a),db=digitSum(b);
        string aa=to_string(a),bb=to_string(b);
        if(da==db)return aa<bb;else return da<db; });
//    rep(i,1,N+1)cout<<a[i]<<" ";
//    cout<<endl;
    rep(i,1,N+1)if(a[i]==K){cout<<i<<" ";break;}
    cout<<a[K]<<endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

