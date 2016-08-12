/*
 * =====================================================================================
 *
 *       Filename:  BinaryTree.cpp
 *
 *    Description:   http://www.nowcoder.com/practice/5b80ab166efa4551844657603227caeb?rp=3&ru=/activity/oj&qru=/ta/kaoyan/question-ranking
 *
 *        Version:  1.0
 *        Created:  08/12/2016 08:30:41
 *       Revision:  none
 *       Compiler:  g++
 *
 *         Author:  liuxueyang (), 
 *   Organization:  
 *
 * =====================================================================================
 */

#include <iostream>
#include <cstdio>


typedef long long ll;
ll a[100], b[100];

using namespace std;

int main(void) {
  ll x , y;
  while (~scanf("%lld%lld", &x, &y)) {
    ll ans = 1;
    int lena = 0;
    while (x) {
      a[lena] = x; ++lena; x /= 2;
    }
    int lenb = 0;
    while (y) {
      b[lenb] = y; ++lenb; y /= 2;
    }
    for (int i = 0; i < lena; ++i) {
      bool mark = false;
      for (int j = 0; j < lenb; ++j) {
        if (b[j] == a[i]) {
          ans = a[i];
          mark = true;
          break;
        }
      }
      if (mark) break;
    }
    printf("%lld\n", ans);
  }

  return 0;
}

