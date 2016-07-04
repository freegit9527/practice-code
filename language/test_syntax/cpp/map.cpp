#include "algostuff.hpp"

int main() {
  map<int, int> my_map;

  my_map[2] = 3;
  my_map[3] = 4;

  my_map[5]++;

  PRINT_MAPPED_ELEMENTS(my_map);

  cout << my_map.size() << endl;

  my_map.erase(5);

  PRINT_MAPPED_ELEMENTS(my_map);

  cout << my_map.size() << endl;

  return 0;
}
