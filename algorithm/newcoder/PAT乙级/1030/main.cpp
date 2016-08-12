/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:   http://www.nowcoder.com/pat/6/problem/4066
 *
 *        Version:  1.0
 *        Created:  08/12/2016 15:57:38
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  liu xue yang, 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <cstdlib>
#include <cstring>
#include <cstdio>
#include <iostream>

using namespace std;
typedef long long ll;
const ll MOD = 1000000007;
const int N = (int)1e5 + 10;
char a[N];
int num[N];
ll an, tn,pn;

int main(void) {
#ifndef ONLINE_JUDGE
  freopen("input.txt","r",stdin);
#endif
  while (~scanf("%s", a)) {
    ll len = strlen(a),result=0; an=tn=pn=0;
    memset(num,0,sizeof(num));
    int i=len-1;
    while(a[i]!='T')--i;
    for(;i>=0;--i){
      if(a[i]=='T')tn++;else if(a[i]=='A')num[i]=tn;
    }
    for(i=0;i<len;++i){
      if(a[i]=='P')pn++;
      else if(a[i]=='A'){
        result=(result+(num[i]%MOD)*pn%MOD)%MOD;
      }
    }
    printf("%lld\n",result);
  }
  return 0;
}

