/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  http://www.spoj.com/problems/KPSUM/
 *    因为没有去掉调试的输出，WA了也不知道为啥，所以浪费了很长时间。。。
 *
 *        Version:  1.0
 *        Created:  08/16/2016 12:32:53
 *       Compiler:  g++
 *
 *         Author:  Sabastian (liuxueyang.github.io),
 * read3valprintloop@gmail.com
 *
 * =====================================================================================
 */
#include <bits/stdc++.h>
using namespace std;
#define _                                                                      \
  ios_base::sync_with_stdio(0);                                                \
  cin.tie(0);
#define rep(i, a, n) for (int i = a; i < n; ++i)
#define per(i, a, n) for (int i = n - 1; i >= a; --i)
#define pb push_back
#define mp make_pair
#define all(x) (x).begin(), (x).end()
#define fi first
#define se second
#define SZ(x) ((int)(x).size())
typedef vector<int> VI;
typedef map<int, int> MI;
typedef long long ll;
typedef pair<int, int> PII;
const ll MOD = 1000000007;
ll N;
int a[20];

ll check(ll n) {
  int t = 1,a[20],j;
  ll ans = 0, tn;
  rep(i, 1, n + 1) {
    tn = i;j=0;
    while (tn) {
      a[j++]=tn%10;
      tn /= 10;
    }
    per(k,0,j){ans+=t*a[k];t*=-1;}
  }
  return ans;
}
ll getSum1(int n,int k){
  if(k&1)return -(ll)pow(10,n)/2;
  else{
    if(n&1)return -45*(ll)pow(10,n-1);
    else return 0;
  }
}
ll getSum2(ll prefix,int n){
  int presum=0,t=1,d=0;
  while(prefix){
    presum+=(prefix%10)*t;prefix/=10;d++;t=-t;
  }
  presum*=-t;ll ans=0;if((n+d)%2==0)ans+=presum*(ll)pow(10,n);
  return ans+=getSum1(n,n+d);
}
ll getSum3(ll n){
  ll ans=0,p,tn;
  int d=0,a[20],t=1;
  if(n<=9){
    rep(i,1,n+1){
      ans+=t*i;t=-t;
    }
    return ans;
  }
  ans=5;
  d=(ll)log10(n);p=(ll)pow(10,d);tn=n;int msd;ll prefix=0;
  rep(i,1,d){
    rep(j,1,10)ans-=getSum2(j,i);
  }
  while(d>0){
    msd=tn/p;rep(i,0,msd){
      if(prefix)ans-=getSum2(prefix,d);
      ++prefix;
    }
    prefix*=10;tn%=p;d--;p/=10;
  }
//  cout<<"ans="<<ans<<"tn="<<tn<<"prefix="<<prefix<<endl;
  t=-1;rep(i,0,tn+1){
    ll cur=prefix+i;int j=0;while(cur){
      a[j++]=cur%10;cur/=10;
    }
    per(k,0,j){
      ans+=a[k]*t;t=-t;
    }
  }
  return ans;
}

int main(void) {
#ifndef ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
  freopen("output2.txt", "w", stdout);
#endif /* -----  ONLINE_JUDGE  ----- */

  while(cin>>N){
    if(!N)break;
    cout<<getSum3(N)<<endl;
  }

  return EXIT_SUCCESS;
} /* ----------  end of function main  ---------- */
