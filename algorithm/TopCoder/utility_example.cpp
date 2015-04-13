/*
 * =====================================================================================
 *       Filename : utility_example.cpp
 *    Description : utility example code
 *    Version     : 
 *        Created : 03/20/15 13:00
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <utility>
#include <iostream>
#include <cstdlib>
#include <utility>
#include <cstdio>

using namespace std;


	int
main ( int argc, char *argv[] )
{
	pair<int, int> foo, bar;

	foo = make_pair(10, 20);
	bar = make_pair(10.5, 'a');

	cout << "foo: "  << foo.first << ", "  << foo.second << endl;
	cout << "bar: "  << bar.first << ", "  << bar.second << endl;

	bar = foo;
	cout << "bar: "  << bar.first << ", "  << bar.second << endl;

//	pair<int, char> boo(10, 'x');
//	std::get<0>(boo) = 50;
//	cout << "boo contains: " ;
//	cout << get<0>(boo) << " and "  << get<1>(boo) << endl;

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

