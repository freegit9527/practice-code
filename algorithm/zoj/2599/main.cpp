/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  08/17/2016 11:31:03
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
ll dp[30][300];
void initDp(){
  dp[0][0]=1;
  rep(i,1,22)rep(j,0,190)
    rep(k,0,min(9,j)+1) dp[i][j]+=dp[i-1][j-k];
}
// . return nubmer of those whoes number length is len,digit sum is sum
// O(1)
ll getSum1(int len,int sum){return dp[len][sum];}
ll getSum2(ll n,int s){
  // return numbers in [1..n] whose digit-sum is s
  // (18+18*9)
  int a[20],b[20],j=0,len,presum=0;
  ll ans=0,tn=n;
  while(tn){a[++j]=tn%10;tn/=10;}len=j;
  rep(i,1,j+1)b[j+1-i]=a[i];
  rep(k,1,len){
    rep(i,0,b[k]){
      if(s>=(presum+i))ans+=getSum1(len-k,s-presum-i);
    }
    presum+=b[k];
  }
  rep(i,0,b[len]+1)if((presum+i)==s)++ans;
  return ans;
}
ll getSum3(ll n,ll prefix,int sum){
  // 1~n number of numbers whose digit-sum is sum, num-prefix is prefix
  // O(18)
  ll ans=0,tn=n,tprefix=prefix;
  int a[20],b[20],c[20],len_p,len_n,d=0,presum=0;
  bool mark=false;
  while(tn){a[++d]=tn%10;tn/=10;}
  rep(i,1,d+1)b[d+1-i]=a[i];
  len_n=d;d=0;while(tprefix){a[++d]=tprefix%10;presum+=a[d];tprefix/=10;}
  len_p=d;rep(i,1,d+1)c[d+1-i]=a[i];
  rep(i,1,len_p+1){
    if(c[i]>b[i]){mark=true;break;} //prefix > n_prefix
    else if(c[i]<b[i]){break;}
  }
  if(mark)rep(i,1,len_n-len_p)ans+=getSum1(i,sum-presum);
  else rep(i,1,len_n-len_p+1)ans+=getSum1(i,sum-presum);
  if(presum==sum)ans++;
  return ans;
}
ll getSum4(int sum,ll k,ll n){
  // 1~n whose digit-sum is sum and lexgical<=k
  // O(18*9)
  ll ans=0,prefix=0,presum=0;
  int a[20],b[20],len_k,d=0,tk=k;
  while(tk){a[++d]=tk%10;tk/=10;}len_k=d;
  rep(i,1,d+1)b[d+1-i]=a[i];
  rep(i,1,len_k+1){
    rep(j,0,b[i]){
      ll t_prefix=prefix*10+j,t_presum=presum+j;
      if(t_prefix)ans+=getSum3(n,t_prefix,sum-t_presum);
    }
    prefix=prefix*10+b[i];presum+=b[i];
    if(presum==sum)ans++;
  }
  return ans;
}
ll getResult2(ll k,ll n){
  // return number k position
  ll ans=0;
  int sum=0,tk=k;
  while(tk){sum+=tk%10;tk/=10;}
  rep(i,1,sum){
    ans+=getSum2(n,i);
  }
  cout<<"res1="<<ans
    <<" res2="<<getSum4(sum,k,n)
    <<endl;
  ans=getSum4(sum,k,n);
  return ans;
}
ll getResult1(ll k,ll n){
  ll prefix=1,cnt;
  int sum,presum=1;
  rep(i,1,190){
    if((cnt=getSum2(n,i))>=k){sum=i;break;}
    k-=cnt;
  }
  while(true){
    while((cnt=getSum3(n,prefix,sum))<k){
      k-=cnt;presum++;prefix++;
    }
    if(presum==sum)break;
    prefix*=10;
  }
  while(--k)prefix*=10;
  return prefix;
}

int main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input1.txt", "r", stdin);
  freopen("output1.txt","w",stdout);
#endif     /* -----  ONLINE_JUDGE  ----- */
  initDp();
  ll n,k;
    for(int i=25;i<1000;++i){
      for(int j=9;j<30;++j){
        int _i=j,_s=0,_t=0;while(_i){_s+=_i%10;_i/=10;_t++;}
        for(int k=_s;k<=_t*9;++k)cout<<getSum3(i,j,k)<<endl;
      }
    }
  while(cin>>n>>k){
    if(!n)break;
//    cout<<"n="<<n
//      <<" k="<<k
//      <<endl;
//    cout<<getResult2(k,n)<<endl;
//    cout<<getResult1(k,n)<<endl;
//    cout<<getResult2(k,n)<<" "<<getResult1(k,n)<<endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

