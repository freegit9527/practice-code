#include <bits/stdc++.h>

using namespace std;

#define pb push_back
#define orta (bas + son >> 1)
#define sag (k + k + 1)
#define sol (k + k)
#define endl '\n'
#define foreach(i,x) for(type(x)i=x.begin();i!=x.end();i++)
#define FOR(ii,aa,bb) for(int ii=aa;ii<=bb;ii++)
#define ROF(ii,aa,bb) for(int ii=aa;ii>=bb;ii--)
#define mp make_pair
#define nd second
#define st first
#define type(x) __typeof(x.begin())

typedef pair < int ,int > pii;

typedef long long ll;

const long long linf = 1e18+5;
const int mod = (int) 1e9 + 7;
const int logN = 17;
const int inf = 1e9;
const int N = 2e5 + 5;

int n, x, y, z;
map< int , int > d;

int main() {

  scanf("%d", &n);

  set< int > S;

  FOR(i, 1, n) {
    scanf("%d", &x);
    type(S) it = S.lower_bound(x);
    if(!S.size()) {
      d[x] = 1;
    }
    else {
      if(it == S.end()) {
        it--;
        d[x] = d[*it] + 1;
        printf("%d ",*it);
      }
      else if(it == S.begin()) {
        d[x] = d[*it] + 1;
        printf("%d ",*it);
      }
      else {
        int t = *it; it--;
        int t2 = *it;
        if(d[t] < d[t2]) t = t2;
        printf("%d ", t);
        d[x] = d[t] + 1;
      }
    }
    S.insert(x);
  } cout << endl;

  return 0;
}
