#ifndef ALGOSTUFF_HPP
#define ALGOSTUFF_HPP

#include <bits/stdc++.h>

using namespace std;

/*
  INSERT_ELEMENTS (collection, first, last)
  - fill values from first to last into the collection
  - NOTE: NO half-open range
 */
template <typename T>
inline void INSERT_ELEMENTS (T & coll, int first, int last) {
  for (int i = first; i <= last; ++i) {
    coll.insert(coll.end(), i);
  }
}

/*
  PRINT_ELEMENTS()
  - print optional string optcstr followed by all elements of the
  collection coll
  - separated by spaces
 */
template <typename T>
inline void PRINT_ELEMENTS(const T & coll,
                           const int & width = 2,
                           const string & optcstr = "") {
  cout << optcstr;
  for (auto elem : coll) {
    cout.width(width);
    cout << left << elem;
  }
  cout << endl;
}

/*
  PRINT_MAPPED_ELEMENTS()
  - prints optional string optcstr followed by all elements of
  the key/value collection coll separated by spaces
 */
template <typename T>
inline void PRINT_MAPPED_ELEMENTS (const T & coll,
                                   const string & optcstr = "") {
  cout << optcstr;
  for (auto elem : coll) {
    cout << '[' << elem.first
         << ',' << elem.second << "] ";
  }
  cout << endl;
}

#endif
