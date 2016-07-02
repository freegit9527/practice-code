#include "algostuff.hpp"

using namespace std;

int main(void) {
  list<int> coll;

  INSERT_ELEMENTS(coll, 1, 9);
  INSERT_ELEMENTS(coll, 1, 9);
  coll.sort();

  for (auto i = coll.cbegin(); i != coll.cend(); ++i) {
    cout.width(3);
    cout << left << distance(coll.cbegin(), i) + 1;
  }

  cout << endl;

  PRINT_ELEMENTS(coll, 3);

  // print first and last position 5 could get inserted
  auto pos1 = lower_bound(coll.cbegin(), coll.cend(), 5);
  auto pos2 = upper_bound(coll.cbegin(), coll.cend(), 5);

  cout << "5 could get position " << distance(coll.cbegin(), pos1) + 1
       << " up to " << distance(coll.cbegin(), pos2) + 1
       << " without breaking the sorting." << endl;

  // insert 3 at the first possible position without breaking the
  // sorting
  coll.insert(lower_bound(coll.cbegin(), coll.cend(), 3), 3);
  PRINT_ELEMENTS(coll, 3);

  // insert 7 at the last possible position without breaking the
  // sorting
  coll.insert(upper_bound(coll.cbegin(), coll.cend(), 7), 7);

  PRINT_ELEMENTS(coll, 3);

  return 0;
}
