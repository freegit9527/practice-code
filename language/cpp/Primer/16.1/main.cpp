#include <iostream>
#include <vector>
#include <string.h>
#include <algorithm>

using namespace std;

template <typename T1, typename T2>
int compare (const T1 &v1, const T2 &v2) {
  if (v1 < v2) return -1;
  if (v1 > v2) return 1;
  return 0;
}

class Point {
public:
  int x;
  int y;
};

int main (void) {
  cout << compare(1, 0) << endl;

  plus<int> intAdd;

  int sum = intAdd(10, 20);
  cout << sum << endl;

  negate<int> intNegate;
  sum = intNegate(intAdd(20, 40));

  cout << sum << endl;

  cout << less<int>() (20, 20) << endl;

  int a[] = {
    3, 2, 1, 4, 5
  };

  sort(a, a + 5, [](int a, int b) {
      return a < b;
    });

  for (int i = 0; i < 5; ++i) {
    printf("i = %d ", a[i]);
  }

  Point p[5];
  for (int i = 1; i <= 5; ++i) {
    p[i - 1].x = 5 - i;
    p[i - 1].y = i + 1;
  }

  for (int i = 0; i < 5; ++i) {
    printf("%d, %d\n", p[i].x, p[i].y);
  }

  sort(p, p + 5, [](Point a, Point b) {
      return a.x < b.x;
    });

  cout << "sorted: " << endl;

  for (int i = 0; i < 5; ++i) {
    printf("%d, %d\n", p[i].x, p[i].y);
  }

  return 0;
}
