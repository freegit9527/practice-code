/*
 * =====================================================================================
 *       Filename : Glass_Carving.cpp
 *    Description : round 296 C Problem: Glass Carving
 *    Version     : 
 *        Created : 03/23/15 10:26
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <set>
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <algorithm>

using namespace std;

#define	ULL unsigned long long int			/*  */

	int
main ( int argc, char *argv[] )
{
//	freopen("Glass_Carving.txt", "r", stdin);
	ULL w, h, n;
	set<ULL> hight, wide;
	multiset<ULL> hight_len, wide_len;
	string str;
	set<ULL>::iterator it, pre, nex;

	while ( cin >> w >> h >> n ) {
		hight.clear();
		wide.clear();
		hight_len.clear();
		wide_len.clear();

		hight.insert(0);
		hight.insert(h);

		wide.insert(0);
		wide.insert(w);

		hight_len.insert(h);
		wide_len.insert(w);

		while ( n-- ) {
			ULL pos;
			cin >> str >> pos;
			
			if ( 'H' == str[0] ) {
				// divide hight when 'H'
				it = (hight.insert(pos)).first;
				pre = --it;
				nex = ++it;
				++nex;
				hight_len.erase(hight_len.lower_bound(*nex - *pre));
				hight_len.insert(pos - *pre);
				hight_len.insert(*nex - pos);
				cout << (*(hight_len.rbegin())) * (*(wide_len.rbegin())) << endl;
			}
			else {
				// divide wide when 'V'
				it = (wide.insert(pos)).first;
				pre = --it;
				nex = ++it;
				++nex;
				wide_len.erase(wide_len.lower_bound(*nex - *pre));
				wide_len.insert(pos - *pre);
				wide_len.insert(*nex - pos);
				cout << (*hight_len.rbegin()) * (*wide_len.rbegin()) << endl;
			}
		}
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

