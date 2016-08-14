/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  http://www.spoj.com/problems/CPCRC1C/
 *
 *        Version:  1.0
 *        Created:  08/14/2016 19:17:00
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
int num_sum(int);
// ll result;
int num_len(int n) {
  return floor(log10(n))+1;
}
ll solve(int n) {
  if(n<=0)return 0;
  if(num_len(n)==1)return (1+n)*n/2;
  return solve(n-n%10-1)+num_sum(n/10)*(n%10+1)+solve(n%10);
}
int num_sum(int n) {
  int re=0;while(n){re+=n%10;n/=10;}
  return re;
}
ll bruteForce(int n) {
  ll re=0;
  rep(i,1,n+1)re+=num_sum(i);
  return re;
}

int main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  int a,b;while(cin>>a>>b&&(a!=-1)){
    // result=0;
    // cout<<solve(a)<<","<<solve(b)<<endl;
    cout<<solve(b)-solve(a-1)<<endl;
    // cout<<"***"<<endl;
    // cout<<bruteForce(a)<<","<<bruteForce(b)<<endl;
    cout<<bruteForce(b)-bruteForce(a-1)<<endl;
    // cout<<"========"<<endl;
  }
  // cout<<"---"<<endl;
  // rep(i,1,301){
  //   int i1=solve(i),i2=bruteForce(i);
  //   if(i1!=i2)cout<<i<<" ("<<i1<<","<<i2<<") ";
  // }


  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

