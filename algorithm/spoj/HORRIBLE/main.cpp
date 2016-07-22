// 2016/07/22 14:38:03 PM
// Sabastian


#include <iostream>
#include <stdio.h>
#include <string.h>

using namespace std;

typedef long long ll;

typedef struct TreeNode {
  int start, end;
  ll total;
  ll lazy;
} TreeNode;

TreeNode tree[4 * 100000 + 10];

void printNode(int stIndex) {
  TreeNode &t = tree[stIndex];
  printf("(%d, %d), lazy=%lld, total=%lld\n",
         t.start, t.end, t.lazy, t.total);
}

void build(int stIndex, int start, int end) {
  tree[stIndex].start = start;
  tree[stIndex].end = end;
  tree[stIndex].total = 0;
  tree[stIndex].lazy = 0;

  if (start == end) {
    return;
  }

  int mid = (start + end) / 2, leftChildIndex = stIndex * 2,
    rightChildIndex = leftChildIndex + 1;
  build(leftChildIndex, start, mid);
  build(rightChildIndex, mid + 1, end);
}

void UpdateNode(int stIndex, TreeNode & t, ll value) {
  bool isLeaf = (t.start == t.end);

  t.total += (t.end - t.start + 1) * value;
  if (!isLeaf) {
    tree[stIndex * 2].lazy += value;
    tree[stIndex * 2 + 1].lazy += value;
  }
  t.lazy = 0;

  return;
}

void update(int stIndex, int start, int end, ll value) {
  TreeNode & t = tree[stIndex];

  // needs updated
  if (t.lazy) {
    UpdateNode(stIndex, t, t.lazy);
  }

  if (start > t.end || end < t.start || start > end) {
    return;
  }

  // node contain is contained in [start..end]
  if (t.start >= start && t.end <= end) {
    UpdateNode(stIndex, t, value);
    return;
  }

  int leftChildIndex = stIndex * 2, rightChildIndex = leftChildIndex + 1;

  update(leftChildIndex, start, end, value);
  update(rightChildIndex, start, end, value);
  t.total = tree[leftChildIndex].total + tree[rightChildIndex].total;

  return;
}

ll query(int stIndex, int start, int end) {
  TreeNode & t = tree[stIndex];

  // needs updated
  if (t.lazy) {
    UpdateNode(stIndex, t, t.lazy);
  }

  if (start > t.end || end < t.start || start > end) {
    return 0;
  }

  // node contain is contained in [start..end]
  if (t.start >= start && t.end <= end) {
    return t.total;
  }

  int leftChildIndex = stIndex * 2, rightChildIndex = leftChildIndex + 1;

  return query(leftChildIndex, start, end) +
    query(rightChildIndex, start, end);
}

int main(void) {
  #ifdef DEBUG
  freopen("input.txt", "r", stdin);
  #endif

  int T, N, C;

  cin >> T;
  while (T--) {
    cin >> N >> C;
    build(1, 0, N - 1);

    while (C--) {
      int op, p, q;
      // you must declare v as long long, or it will WA.
      // Problem says: v <= 10^7, don't know why...
      ll v;

      cin >> op;
      if (op) {
        // query
        cin >> p >> q;
        p--; q--;
        cout << query(1, p, q) << endl;
      }
      else {
        cin >> p >> q >> v;
        p--; q--;
        update(1, p, q, v);
      }
    }
  }
  return 0;
}
