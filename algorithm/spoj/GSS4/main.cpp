// 2016/07/22 19:58:12 PM
// Sabastian

#include <iostream>
#include <stdio.h>
#include <string.h>
#include <math.h>

using namespace std;

typedef long long ll;

typedef struct TreeNode {
  int start, end;
  ll total;
  bool lazy;
} TreeNode;

TreeNode tree[4 * 100000 + 10];
ll a[4 * 100000 + 10];

void update(int stIndex, int start, int end);

void printNode(int stIndex) {
  TreeNode &t = tree[stIndex];
  printf("%d (%d, %d), total=%lld\n",
         stIndex, t.start, t.end, t.total);
}

void build(int stIndex, int start, int end) {
  tree[stIndex].start = start;
  tree[stIndex].end = end;
  tree[stIndex].lazy = false;

  if (start == end) {
    tree[stIndex].total = a[start];
    return;
  }

  int mid = (start + end) / 2, leftChildIndex = stIndex * 2,
    rightChildIndex = leftChildIndex + 1;
  build(leftChildIndex, start, mid);
  build(rightChildIndex, mid + 1, end);
  tree[stIndex].total = tree[leftChildIndex].total +
    tree[rightChildIndex].total;
}

void UpdateNode(int stIndex, TreeNode & t, int start, int end,
                bool updating) {
  bool isLeaf = (t.start == t.end);

  if (isLeaf) {
    tree[stIndex].total = floor(sqrt(tree[stIndex].total));
  }
  else {
    int leftChildIndex = stIndex * 2,
      rightChildIndex = leftChildIndex + 1;

    if (updating) {
      tree[leftChildIndex].lazy = tree[rightChildIndex].lazy = true;
    }
    else {
      update(leftChildIndex, start, end);
      update(rightChildIndex, start, end);
      tree[stIndex].total = tree[leftChildIndex].total +
        tree[rightChildIndex].total;
    }
  }

  return;
}

bool NecessaryUpdate(int stIndex) {
  TreeNode & t = tree[stIndex];
  return t.total > (t.end - t.start + 1);
}

void update(int stIndex, int start, int end) {
  TreeNode & t = tree[stIndex];

  if (t.lazy) {
    if (NecessaryUpdate(stIndex)) {
      UpdateNode(stIndex, t, start, end, true);
    }
  }

  if (start > t.end || end < t.start || start > end) {
    return;
  }

  // node contain is contained in [start..end]
  if (t.start >= start && t.end <= end) {
    if (NecessaryUpdate(stIndex)) {
      // cout << stIndex << ", <" << start << ", " << end << ">\n";
      UpdateNode(stIndex, t, start, end, true);
    }
    return;
  }

  int leftChildIndex = stIndex * 2, rightChildIndex = leftChildIndex + 1;

  update(leftChildIndex, start, end);
  update(rightChildIndex, start, end);
  t.total = tree[leftChildIndex].total + tree[rightChildIndex].total;

  return;
}

ll query(int stIndex, int start, int end) {
  TreeNode & t = tree[stIndex];

  if (t.lazy) {
    if (NecessaryUpdate(stIndex)) {
      UpdateNode(stIndex, t, start, end, false);
    }
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

  int N, M;

  int c = 1;
  while (cin >> N) {
    cout << "Case #" << c << ":" << endl;
    ++c;
    for (int i = 0; i < N; ++i) {
      cin >> a[i];
    }

    build(1, 0, N - 1);
    cin >> M;
    for (int m = 1; m <= M; ++m) {
      int i, x, y;
      cin >> i >> x >> y;
      x--; y--;
      if (i) {
        cout << query(1, x, y) << endl;
      }
      else {
        update(1, x, y);
      }

      // print test
      // for (int ii = 1; ii <= 9; ++ii) {
      //   printNode(ii);
      // }
      // cout << "--------" << endl << endl;
    }
    cout << endl;
  }
  return 0;
}
