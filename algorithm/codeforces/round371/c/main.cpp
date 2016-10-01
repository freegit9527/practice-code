// 2016/10/01 21:51
#include <iostream>
#include <map>

using namespace std;

typedef long long ll;

int t;
ll a;
map<int,int> m;

int main(void) {
  #ifndef ONLINE_JUDGE
  freopen("in.txt", "r", stdin);
  #endif

  while(cin >> t) {
    m.clear();
    while(t--) {
      string cmd;
      cin >> cmd >> a;
      ll a1 = a, a2 = 0, base = 1;

      while (a1) {
        if (a1 & 1) {
          a2 = base + a2;
        }
        base *= 10;
        a1 /= 10;
      }
      
      if ("+" == cmd) {
        if (m[a2]) {
          m[a2]++;
        }
        else {
          m[a2] = 1;
        }
      }
      else if ("-" == cmd) {
        m[a2]--;
      }
      else {
        cout << m[a2] << endl;
      }
    }
  }
  
  return 0;
}
