/*
 * =====================================================================================
 *       Filename : 1213_HowManyTables.cpp
 *    Description : hdu 1213 How Many Tables
 *    Version     : Union Find Set
 *        Created : 03/22/15 11:23
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cstring>

using namespace std;

int tree_size[1000+1];
int parent[1000+1];
int sum_cnt_tree;

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
		return;
	}
	if ( tree_size[root_a] > tree_size[root_b] ) {
		parent[root_b] = root_a;
	}
	else {
		parent[root_a] = root_b;
	}
	--sum_cnt_tree;

	return ;
}		/* -----  end of function union_tree  ----- */

	int
main ( int argc, char *argv[] )
{
	int T;
	int A, B, M, N;
//	freopen("1213_HowManyTables.txt", "r", stdin);

	cin >> T;
	while ( T-- ) {
		cin >> N >> M;
		sum_cnt_tree = N;
		for ( int i = 1; i <= N; ++i ) {
			tree_size[i] = 1;
			parent[i] = i;
		}
		while ( M-- ) {
			cin >> A >> B;
			union_tree(A, B);
		}
		cout << sum_cnt_tree << endl;
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

