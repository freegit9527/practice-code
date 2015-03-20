/*
 * =====================================================================================
 *       Filename : stringstream_example.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/20/15 13:58
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <sstream>
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <string>

using namespace std;


	int
main ( int argc, char *argv[] )
{
	istringstream iss;
	string strvalues = "32 240 2 1450";

	iss.str(strvalues);
	for ( int n = 0; n < 4; ++n ) {
		int val;
		iss >> val;
		cout << val << endl;
	}
	cout << "Finished writing the numbers in: " ;
	cout << iss.str() << "\n" ;

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

