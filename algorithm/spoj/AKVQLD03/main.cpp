#include <iostream>
#include <string.h>

using namespace std;

struct SegmentTreeNode {
  // fields on the node
  long long sum;

  void assignLeaf(int value) {
    sum = value;
  }

  void merge(SegmentTreeNode &left, SegmentTreeNode &right) {
    sum = left.sum + right.sum;
  }

  long long getValue() {
    return sum;
  }
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

int a[1000000 + 10];

int main(void) {
  #ifdef DEBUG
  freopen("input.txt", "r", stdin);
  #endif

  int N, Q;

  scanf("%d%d", &N, &Q);
  memset(a, 0, sizeof(a));
  SegmentTree<int, long long> tree(a, N);

  while (Q--) {
    char op[10];
    int A, B;
    scanf("%s%d%d", op, &A, &B);

    if (op[0] == 'f') {
      printf("%lld\n", tree.getValue(A - 1, B - 1));
    }
    else {
      tree.update(A - 1, B + a[A - 1]);
      a[A - 1] += B;
    }
  }

  return 0;
}
