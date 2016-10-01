// 2016/10/01 21:25:23

#include <iostream>
#include <algorithm>
#include <set>

using namespace std;

const int N = 100000 + 10;
int a[N], b[5], n;
set<int> s;

int main() {
  #ifndef ONLINE_JUDGE
  freopen("in.txt", "r", stdin);
  #endif
  
  while (cin >> n) {
    s.clear();
    for (int i = 0; i < n; ++i) {
      cin >> a[i];
      s.insert(a[i]);
    }
    if (s.size() < 3) {
      cout << "YES\n";
    }
    else if (s.size() > 3) {
      cout << "NO\n";
    }
    else {
      set<int>::iterator it;
      int j = 0;
      for (it = s.begin(); it != s.end(); it++) {
        b[j] = *it;
        j++;
      }
      sort(b, b + 3);
      if (b[1] - b[0] == b[2] - b[1]) {
        cout << "YES\n";
      }
      else {
        cout << "NO\n";
      }
    }
  }
  
  return 0;
}
