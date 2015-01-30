/*
 * =====================================================================================
 *       Filename : b_handle.cpp
 *    Description : 
 *    Version     : 
 *        Created : 01/12/15 17:18
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <map>
#include <iostream>
#include <algorithm>
#include <string>
#include <cstdio>
#include <cstdlib>
using namespace std;


	int
main ( int argc, char *argv[] )
{
#ifdef BUG
	freopen("b_handle.txt", "r", stdin);
#endif
	int n;
	cin >> n;

	string _new, _old;
	map<string, string> name;
	for ( int i = 0; i < n; ++i ) {
		cin >> _old >> _new;
		if ( name.count(_old) == 1 ) {
			string _tmp = name[_old];
			name.erase(_old);
			name[_new] = _tmp;
		}
		else {
			name[_new] = _old;
		}
	}
	map<string, string>::iterator it;
	cout << name.size() << endl;
	for ( it = name.begin(); it != name.end(); ++it ) {
		cout << it->second  << " " << it->first << endl; 
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

