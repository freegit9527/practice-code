/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  http://www.lightoj.com/volume_showproblem.php?problem=1205
 *
 *        Version:  1.0
 *        Created:  08/20/2016 15:08:52
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

int dp[20];

int integerToArray(ll n,int a[]) {
  // 把一个整数放到数组里面，返回整数的长度
  int i=0;

  while(n){
    a[++i]=n%10;
    n/=10;
  }

  int len=i;
  rep(i,1,len/2+1)
    swap(a[i],a[len+1-i]);

  return len;
}

void initDP(){
  // 0~10^n范围里面的回文数字的数目
  ll t=1;
  for(int i=1;i<=17;i+=2){
    dp[i]=dp[i+1]=9*t;
    t*=10;
  }
  // 0也算
  dp[1]++;
}

ll solve(ll n){
  if(n<0)return 0;
  if(!n)return 1;
  if(n<10)return n+1;

  ll ans=0,tt;
  int ar[20],len=integerToArray(n,ar);
  bool oddp=(len&1)?true:false;
  // 位数小于n的位数的回文数的数目
  rep(i,1,len)ans+=dp[i];
  int upp=oddp?(len/2+1):(len/2);

  rep(i,1,upp+1){
    int st=ar[i],en=ar[len+1-i];
    if(0==st||0==en)
  }

  return ans;
}

int main ( void )
{
  _
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  initDP();
  int T;cin>>T;
  ll start,end;
  rep(i,1,T+1){
    cout<<"Case "<<i<<": ";
    cin>>start>>end;
    if(start>end)swap(start,end);
    cout<<solve(end)-solve(start-1);
    cout<<" (" <<solve(end) <<", " <<solve(start-1) <<")";
    cout<<endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

