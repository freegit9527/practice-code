#include <stdio.h>
#include <math.h>

int main(void) {
  double r, h;
  const double pi = acos(-1.0);
  scanf("%lf%lf", &r, &h);
  double area = pi * r * r * 2 + pi * 2 * r * h;
  printf("Area = %.3f\n", area);

  return 0;
}
