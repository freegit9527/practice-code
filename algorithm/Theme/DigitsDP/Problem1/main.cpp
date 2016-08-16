/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  给定A，B（A、B < 10^15），求[A,B]内的所有数的
 *    k(2<=k<=10)进制表示下的个数位之和。
 *
 *        Version:  1.0
 *        Created:  08/15/2016 11:48:47
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

ll getSum1(int n,int k){
  // n 是自由位的数目，k是进制，求[0,k^n-1]的所有数字的数位之和.
  // eg. [0,99] 那么n=2
  return (ll)pow(k,n)*n*(k-1)/2;
}
ll getSum2(int prefix,int n,int k){
  // 求小区间的数位和，比如[100,199]
  // prefix是公共前缀和，n是自由位数目，k是进制，比如[51000,51999]公
  // 共前缀就是5+1=6, n=3, k=10
  return getSum1(n,k)+prefix*(ll)pow(k,n);
}
ll getSum3(int prefix,ll n,int k){
  // 求[0,n]的在k进制下的数位和，n的范围是10^15，prefix是公共前缀
  // 和，n是自由位数目，k是进制
  ll ans=0;
  if(n<k){rep(i,0,n+1)ans+=i+prefix; return ans;}
  int freeNum=(ll)log10(n)/(ll)log10(k),
    msd=n/(ll)pow(k,freeNum); // msd is Most Significant Digit
  rep(i,0,msd)ans+=getSum2(i+prefix,freeNum,k);
  return ans+=getSum3(msd+prefix,n%(ll)pow(k,freeNum),k);
}

ll check(ll n,int k){
  ll ans=0;for(ll i=1;i<=n;++i){
    ll t=i;while(t){ans+=t%k;t/=k;}
  }
  return ans;
}

int main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  ll a,b;while(cin>>a>>b&&a!=-1){
    cout<<getSum3(0,b,10)-getSum3(0,a-1,10)<<endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

