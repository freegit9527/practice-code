/*
 * =====================================================================================
 *       Filename : ErrorCorrectSystem.cpp
 *    Description : problem B round 296
 *    Version     : 
 *        Created : 03/20/15 20:08
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <set>
#include <cstdlib>
#include <cstdio>
#include <algorithm>
#include <utility>

using namespace std;


	int
main ( int argc, char *argv[] )
{
//	freopen("ErrorCorrectSystem.txt", "r", stdin);
	int n;
	string S, T;
	while ( cin >> n >> S >> T ) {
		set<pair<char, char> > reme;
		int diff = 0;
		for ( size_t i = 0; i < S.size(); ++i ) {
			if ( S[i] != T[i] ) {
				diff++;
			}
		}
		int flag = 0;
		int first, last;
		for ( size_t i = 0; i < S.size(); ++i ) {
			if ( T[i] != S[i] ) {
				pair<char, char> tmp(T[i], S[i]);
				if ( reme.find(tmp) != reme.end() ) {
					flag = 2;
					last = i;
					break;
				}
				reme.insert(make_pair(S[i], T[i]));
			}
		}
		if ( 2 == flag ) {
			cout << diff - 2 << endl;
			for ( size_t j = 0; j < S.size(); ++j ) {
				if ( S[j] == T[last] && T[j] == S[last] ) {
					first = j;
					break;
				}
			}
			cout << first + 1 << " "  << last + 1 << endl;
			continue;
		}
		set<char> s_set, t_set;
		for ( size_t i = 0; i < S.size(); ++i ) {
			if ( T[i] != S[i] ) {
				s_set.insert(S[i]);
				t_set.insert(T[i]);
			}
		}
		set<char>::iterator it;
		char goal;
		for ( it = s_set.begin(); it != s_set.end(); ++it ) {
			if ( t_set.find(*it) != t_set.end() ) {
				flag = 1;
				goal = *it;
				break;
			}
		}
		if ( 1 == flag ) {
			
			for ( size_t j = 0; j < S.size(); ++j ) {
				if ( S[j] != T[j] && goal == S[j] ) {
					first = j;
					break;
				}
			}
			for ( size_t j = 0; j < S.size(); ++j ) {
				if ( S[j] != T[j] && goal == T[j] ) {
					last = j;
					break;
				}
			}
			cout << diff - flag << endl;
			cout << first + 1 << " "  << last + 1 << endl;
			continue;
		}
		cout << diff << endl;
		cout << "-1 -1" << endl;
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
