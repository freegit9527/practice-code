/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:   http://www.nowcoder.com/pat/6/problem/4077
 *
 *        Version:  1.0
 *        Created:  08/12/2016 15:17:32
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:   liuxueyang
 *   Organization:  
 *
 * =====================================================================================
 */
#include <cstdlib>
#include <iostream>
#include <cstdio>

using namespace std;
typedef long long ll;
int main(void) {
#ifndef ONLINE_JUDGE
  freopen("input.txt","r",stdin);
#endif
  int T; scanf("%d", &T); for(int i=1;i<=T;++i) {
    ll a,b,c; scanf("%lld%lld%lld",&a,&b,&c); printf("Case #%d: %s\n", i,a+b>c?"true":"false");
  }
  return 0;
}

