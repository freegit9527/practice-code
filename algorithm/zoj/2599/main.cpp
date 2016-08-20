/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  数位DP论文里面的一道题目
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

int integerDigitSum(ll n){
  // 计算一个整数的数位和
  int sum=0;
  while(n){
    sum+=n%10;
    n/=10;
  }
  return sum;
}

int integerLength(ll n){
  // 整数的长度
  int len=0;
  while(n){
    n/=10;
    ++len;
  }
  return len;
}

void initDp(){
  // O(19*172*9)
  dp[0][0]=1;

  rep(i,1,20)
    rep(j,0,i*9+1)
      rep(k,0,min(9,j)+1) 
        dp[i][j]+=dp[i-1][j-k];
}

ll getSum1(int len,int sum){
// 数字长度是len并且数位和是sum的数字的个数，数位长度包括前导零
// O(1)
  return dp[len][sum];}

ll getSum2(ll n,int sum){
  // 1~n里面数位和是sum的数字的个数
  // (18*9+10)
  int a[20],len=integerToArray(n,a),presum=0;
  ll ans=0;

  rep(k,1,len){
    rep(i,0,a[k]){
      if(sum>=(presum+i)){
        ans+=getSum1(len-k,sum-presum-i);
      }
    }
    presum+=a[k];
  }

  rep(i,0,a[len]+1)
    if((presum+i)==sum)++ans;
  return ans;
}

ll getSum3(ll n,ll prefix,int sum){
  // 1~n里面数字前缀是prefix并且数位和是sum的数的个数
  ll ans=0;
  int b[20],c[20],len_p,len_n,presum=integerDigitSum(prefix),mark=0;

  if(prefix>n||presum>sum) return 0;

  len_n=integerToArray(n,b);
  len_p=integerToArray(prefix,c);

  if(len_n==len_p) return presum==sum?1:0;

  rep(i,1,len_p+1){
    if(c[i]>b[i]){mark=1;break;} //prefix > n_prefix
    else if(c[i]<b[i]){mark=-1;break;}
  }
  
  if(presum==sum)ans++;                         /* prefix itself is counted!! */

  if(1==mark) {
    // prefix > n_prefix
    rep(i,1,len_n-len_p)
      ans+=getSum1(i,sum-presum);
  }
  else if(0==mark) {
    rep(i,0,10){
      if(prefix*10+i<=n)
        ans+=getSum3(n,prefix*10+i,sum);
    }
  }
  else {
    rep(i,1,len_n-len_p+1)
      ans+=getSum1(i,sum-presum);
  }
  return ans;
}

ll getSum4(ll n,ll k,int sum){
  // 1~n里面数位和是sum并且字典序小于k的字典序的数的个数
  // O(18*9)
  ll ans=0,prefix=0,presum=0;
  int b[20],len_k;

  len_k=integerToArray(k,b);

  rep(i,1,len_k+1){
    rep(j,0,b[i]){
      ll t_prefix=prefix*10+j;
      if(t_prefix)
        ans+=getSum3(n,t_prefix,sum);
    }
    prefix=prefix*10+b[i];
    presum+=b[i];

    if(presum==sum&&prefix!=k)
      ans++;                       /* digit-sum is the same exclude tailing 0 */
  }
  return ans;
}

ll getResult2(ll n,ll k){
  // 1~n按照规则排序后，数字k的位置
  ll ans=0;
  int sum=integerDigitSum(k);

  rep(i,1,sum){
    ans+=getSum2(n,i);
  }
  ans+=getSum4(n,k,sum);

  return ans+1;
}

ll getResult1(ll n,ll k){
  // 1~n按照规则排序后，第k个位置的数字
  ll prefix=1,cnt;
  int sum=0,presum=1;

  rep(i,1,18*9+1) {
    if((cnt=getSum2(n,i))>=k) {
      sum=i;
      break;
    }
    k-=cnt;
  }

  while(true){
    if(presum==sum)break;
    cnt=getSum3(n,prefix,sum);

    if(cnt<k){
      k-=cnt;
      prefix++;
      presum++;
    }
    else{
      prefix*=10;
    }
  }

  while(--k)prefix*=10;

  return prefix;
}

int main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
  freopen("output1.txt","w",stdout);
#endif     /* -----  ONLINE_JUDGE  ----- */
  initDp();
  ll n,k;

  while(cin>>n>>k){
    if(!n)break;
    cout<<getResult2(n,k)<<" "<<getResult1(n,k)<<endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

