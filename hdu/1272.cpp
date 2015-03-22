/*
 * =====================================================================================
 *       Filename : 1272.cpp
 *    Description : hdu 1272 problem
 *    Version     : Union Find Set
 *        Created : 03/22/15 12:05
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */

#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cstring>
#include <vector>

using namespace std;

int tree_size[100000+1];
int parent[100000+1];
bool flag;

/*  Name:  find_parent
 *  Description:  find a node's parent
 */
	int
find_parent ( int n )
{
	int n_root = n;
	while ( n_root != parent[n_root] ) {
		n_root = parent[n_root];
	}
	int p;
	while ( parent[n] != n_root ) {
		p = parent[n];
		parent[n] = n_root;
		n = p;
	}
	return n_root;
}		/* -----  end of function find_parent  ----- */

/*  Name:  union_tree
 *  Description:  union two tree
 */
	void
union_tree ( int a, int b )
{
	int root_a = find_parent(a),
			root_b = find_parent(b);
	if ( root_a == root_b ) {
		flag = false;
		return;
	}
	if ( tree_size[root_a] > tree_size[root_b] ) {
		parent[root_b] = root_a;
	}
	else {
		parent[root_a] = root_b;
	}

	return ;
}		/* -----  end of function union_tree  ----- */

	int
main ( int argc, char *argv[] )
{
	int A, B;
//	freopen("1272.txt", "r", stdin);
	vector<int> nodes;

	while ( true ) {
		for ( int i = 1; i <= 100000; ++i ) {
			tree_size[i] = 1;
			parent[i] = i;
		}
		nodes.clear();
		cin >> A >> B;
		nodes.push_back(A);
		nodes.push_back(B);
		if ( -1 == A && -1 == B ) {
			break;
		}
		if ( 0 == A && 0 == B ) {
			cout << "Yes"  << endl;
			continue;
		}
		flag = true;
		union_tree(A, B);
		while ( cin >> A >> B ) {
			if ( 0 == A && 0 == B ) {
				break;
			}
			if ( flag ) {
				union_tree(A, B);
				nodes.push_back(A);
				nodes.push_back(B);
			}
		}
		if ( flag ) {
			int one_root = find_parent(*(nodes.begin()));
			for ( vector<int>::iterator it = nodes.begin() + 1; it != nodes.end(); ++it ) {
				if ( find_parent(*it) != one_root ) {
					flag = false;
					break;
				}
			}
			if ( flag ) {
				cout << "Yes" << endl;
			}
			else {
				cout << "No"  << endl;
			}
		}
		else {
			cout << "No" << endl;
		}
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

