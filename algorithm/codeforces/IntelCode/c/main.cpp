#include <iostream>
#include <cstring>
#include <algorithm>

using namespace std;
typedef long long ll;

const int N = 100000 + 10;
typedef struct node {
  int value;
  bool right, left;
}node;

node b[N * 4 + 10];
int a[N];
void build(int n, int l, int r) {
  if (l == r) {
    b[n].value = a[l];
    b[n].right = b[n].left = true;
    return;
  }
  int m = (l + r) / 2;
  build(n * 2, l, m);
  build(n * 2 + 1, m + 1, r);
  b[n].value = b[n * 2].value + b[n * 2 + 1].value;
  b[n].left = b[n].right = true;
}

void update(int pos, int n, int l, int r) {
  if (l == r) {
    b[n].value = 0;
    b[n].left=  b[n].right = false;
    return;
  }
  int m = (l + r) / 2;
  if (pos <= m) {
    update(pos, n * 2, l, m);
  }
  else {
    update(pos, n * 2 + 1, m + 1, r);
  }
  if (b[n*2].right && b[n*2+1].left) {
    b[n].value = b[n*2].value + b[n*2+1].value;
  }else {
    b[n].value = max(b[n * 2].value, b[n * 2 + 1].value);
  }
  b[n].left = b[n*2].left;
  b[n].right = b[n*2+1].right;
}

int main(void) {
#ifndef ONLINE_JUDGE
  freopen("in.txt", "r", stdin);
  #endif
  int n;
  while (cin >> n) {
    for (int i = 1; i <= n; ++i) {
      cin >> a[i];
    }
    memset(b, 0, sizeof(b));
    build(1, 1, n);

    for (int i = 1; i <= n; ++i) {
      int tmp;
      cin >> tmp;
      update(tmp, 1, 1, n);
      cout << b[1].value << endl;
    }
  }
  
  return 0;
}
