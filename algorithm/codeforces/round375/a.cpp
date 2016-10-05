#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cstring>
#include <algorithm>

using namespace std;

int main()
{
        #ifdef DEBUG
        freopen("a_in.txt", "r", stdin);
#endif // DEBUG
        int a[3];
        while (cin >> a[0] >> a[1] >> a[2]){
                sort(a, a + 3);
                cout << a[2] - a[0] << endl;          
        }
  return 0;
}
