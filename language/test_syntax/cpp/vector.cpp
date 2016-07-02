#include "algostuff.hpp"

int main(void) {
  vector<int> presum;

  presum.push_back(0);
  presum.push_back(233);

  PRINT_ELEMENTS(presum);

  cout << "size: " << presum.size() << endl;

  cout << "capacity: " << presum.capacity() << endl;

  cout << "max_size: " << presum.max_size() << endl;

  presum.push_back(256);
  // we see it expanded.
  cout << "capacity: " << presum.capacity() << endl;

  vector<int>::size_type sz;
  vector<int> foo;
  sz = foo.capacity();
  // initial capacity
  cout << "sz = " << sz << endl;

  cout << "making foo grow: " << endl;

  vector<int> numbers;
  INSERT_ELEMENTS(numbers, 1, 100);
  for (auto elem : numbers) {
    foo.push_back(elem);
    if (sz != foo.capacity()) {
      sz = foo.capacity();
      cout << "capacity changed: " << setw(4) << sz;
      cout << " at elem = " << elem << endl;
    }
  }

  // use reserve
  vector<int> bar;
  sz = bar.capacity();
  bar.reserve(100);
  cout << "after reserve, size = " << bar.size() << endl;
  cout << "makeing bar grow" << endl;

  for (auto elem : numbers) {
    bar.push_back(elem);
    if (sz != bar.capacity()) {
      sz = bar.capacity();
      cout << "capacity changed: " << setw(4) << sz << "at elem = " << elem
           << endl;
    }
  }

  return 0;
}
