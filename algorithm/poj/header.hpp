// use by Codeforces
#include <bits/stdc++.h>

// use by POJ which does not support C++11.
#include <algorithm>
//#include <array>
#include <deque>
//#include <forward_list>
#include <functional>
#include <iostream>
#include <iterator>
#include <list>
#include <map>
#include <numeric>
#include <set>
#include <string>
//#include <unordered_map>
//#include <unordered_set>
#include <vector>

using namespace std;

/*
  INSERT_ELEMENTS (collection, first, last)
  - fill values from first to last into the collection
  - NOTE: NO half-open range
 */
template <typename T>
inline void INSERT_ELEMENTS(T &coll, int first, int last) {
  for (int i = first; i <= last; ++i) {
    coll.insert(coll.end(), i);
  }
}

/*
  PRINT_ELEMENTS()
  - print optional string optcstr followed by all elements of the
  collection coll
  - separated by spaces
 */
template <typename T>
inline void PRINT_ELEMENTS(const T &coll, const int &width = 2,
                           const string &optcstr = "") {
  cout << optcstr;
  for (auto elem : coll) {
    cout.width(width);
    cout << left << elem;
  }
  cout << endl;
}

/*
  PRINT_MAPPED_ELEMENTS()
  - prints optional string optcstr followed by all elements of
  the key/value collection coll separated by spaces
 */
template <typename T>
inline void PRINT_MAPPED_ELEMENTS(const T &coll, const string &optcstr = "") {
  cout << optcstr;
  for (auto elem : coll) {
    cout << '[' << elem.first << ',' << elem.second << "] ";
  }
  cout << endl;
}

const int MAX_N = 1000 * 1000 + 10;
int N;

void solve() {
  cin >> N;

  return;
}

int main(void) {

#ifndef ONLINE_JUDGE
  freopen("NUM.txt", "r", stdin);
#endif

  while () {
    solve();
  }

  return 0;
}
