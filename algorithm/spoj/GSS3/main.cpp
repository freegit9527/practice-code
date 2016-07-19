#include <iostream>

using namespace std;

struct SegmentTreeNode {
  int pre, suf, sub, total;

  void assignLeaf(int value) { pre = suf = sub = total = value; }

  void merge(SegmentTreeNode &left, SegmentTreeNode &right) {
    pre = max(left.pre, left.total + right.pre);
    suf = max(left.suf + right.total, right.suf);
    sub = max(left.sub, max(right.sub, left.suf + right.pre));
    total = left.total + right.total;

    return;
  }

  int getValue() { return sub; }
};

template <class T, class V> class SegmentTree {
  SegmentTreeNode *nodes;
  int N;

public:
  SegmentTree(T arr[], int N) {
    this->N = N;
    nodes = new SegmentTreeNode[getSegmentTreeSize(N)];
    buildTree(arr, 1, 0, N - 1);
  }

  ~SegmentTree() { delete[] nodes; }

  V getValue(int lo, int hi) {
    SegmentTreeNode result = getValue(1, 0, N - 1, lo, hi);
    return result.getValue();
  }

  void update(int index, T value) { update(1, 0, N - 1, index, value); }

private:
  void buildTree(T arr[], int stIndex, int lo, int hi) {
    if (lo == hi) {
      nodes[stIndex].assignLeaf(arr[lo]);
      return;
    }

    int left = 2 * stIndex, right = left + 1, mid = (lo + hi) / 2;

    buildTree(arr, left, lo, mid);
    buildTree(arr, right, mid + 1, hi);

    nodes[stIndex].merge(nodes[left], nodes[right]);
  }

  SegmentTreeNode getValue(int stIndex, int left, int right, int lo, int hi) {
    if (left == lo && right == hi) {
      return nodes[stIndex];
    }

    int mid = (left + right) / 2;

    if (lo > mid) {
      return getValue(2 * stIndex + 1, mid + 1, right, lo, hi);
    }
    if (hi < mid + 1) {
      return getValue(2 * stIndex, left, mid, lo, hi);
    }

    SegmentTreeNode leftResult = getValue(2 * stIndex, left, mid, lo, mid);
    SegmentTreeNode rightResult =
        getValue(2 * stIndex + 1, mid + 1, right, mid + 1, hi);
    SegmentTreeNode result;

    result.merge(leftResult, rightResult);
    return result;
  }

  void update(int stIndex, int lo, int hi, int index, T value) {
    if (lo == hi) {
      nodes[stIndex].assignLeaf(value);
      return;
    }

    int left = 2 * stIndex, right = left + 1, mid = (lo + hi) / 2;

    if (index <= mid) {
      update(left, lo, mid, index, value);
    } else {
      update(right, mid + 1, hi, index, value);
    }

    nodes[stIndex].merge(nodes[left], nodes[right]);
  }

  int getSegmentTreeSize(int N) {
    int size = 1;
    while (size < N) {
      size <<= 1;
    }
    return size << 1;
  }
};

int a[50000];

int main() {
  #ifdef DEBUG
  freopen("input.txt", "r", stdin);
  #endif
  int N;
  scanf("%d", &N);

  for (int i = 0; i < N; ++i) {
    scanf("%d", &a[i]);
  }

  SegmentTree<int, int> st(a, N);

  int M;
  scanf("%d", &M);

  while (M--) {
    int op, lo, hi;

    scanf("%d%d%d", &op, &lo, &hi);
    if (op) {
      printf("%d\n", st.getValue(lo - 1, hi - 1));
    } else {
      st.update(lo - 1, hi);
    }
  }

  return 0;
}
