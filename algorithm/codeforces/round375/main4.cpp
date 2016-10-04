#include <map>
#include <iostream>
#include <cstdlib>
#include <vector>
#include <cstdio>
#include <cstring>
#include <algorithm>
#include <set>

using namespace std;

const int N = 2000 + 10;
int a[N];
int ave, n, m;
map<int,int> b, c, xu;
map<int, bool> ex;
vector<int> smal;
vector<int> ke;
set<int> uniqn;

int main()
{
#ifndef ONLINE_JUDGE
  freopen("in4.txt", "r", stdin);
  #endif

  while (cin >> n >> m) {
    //ke.clear(); smal.clear();
    while (!ke.empty()) ke.pop_back();
    while (!smal.empty()) smal.pop_back();
    b.clear(); c.clear(); xu.clear(); ex.clear();
    uniqn.clear();
    for (int i = 1; i <= n; ++i) {
      cin >> a[i];
      b[a[i]]++; // a[i] 出现次数
      ex[a[i]] = true; // a[i] 是否存在
    }
    ave = n / m;
    for (int i = 1; i <= n; ++i) {
      if (a[i] <= m && b[a[i]] < ave) {
        xu[a[i]]++; // a[i] 已经存在的个数
        //smal.push_back(a[i]);
        uniqn.insert(a[i]); // a[i] 仅插入一个
      }
    }
    // 把a[i]插入数组
    for (set<int>::iterator it = uniqn.begin();
         it != uniqn.end();
         ++it) {
      smal.push_back(*it);
    }

    // 如果i在数组中不存在，那么插入。
    for (int i = 1; i <= m; ++i) {
      if (!ex[i]) {
        smal.push_back(i);
        xu[i] = 0;
      }
    }
 
    // 找到可用的位置
    for (int i = 1; i <= n; ++i) {
      // 如果喜欢这个乐队并且这个乐队已经有了足够的位置，加入
      if (a[i] <= m) {
        if (c[a[i]] > ave)
          ke.push_back(i);
        else
          c[a[i]] ++;
      }
      else {
        ke.push_back(i); // 不喜欢，加入
      }
    }
    // 按照乐队排序
    sort(smal.begin(), smal.end());
    int ans_cnt = 0;
    vector<int>::iterator ij = ke.begin();
    for (vector<int>::iterator it = smal.begin();
         it != smal.end();
         ++ it) {
      // 需要多少个位置。
      int cnt = ave - xu[*it];
      //      cout << "*it = " <<*it<< " xu[*it]= "<<xu[*it]<<endl;
      ans_cnt += cnt;
      for (int i = 1; i <= cnt; ++i) {
        a[*ij] = *it;
        ++ij;
      }
    }
    cout << ave << ' ' << ans_cnt << endl;
    for (int i = 1; i <= n; ++i) {
      cout << a[i] << ' ';
    }
    cout << endl;
  }
  
  return 0;
}
