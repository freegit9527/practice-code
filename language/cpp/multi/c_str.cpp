/*
 * =====================================================================================
 *       Filename : c_str.cpp
 *    Description : 
 *    Version     : 
 *        Created : 04/21/15 00:24
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <string>
#include <cstdio>
#include <cstdlib>

using namespace std;


  int
main ( int argc, char *argv[] )
{
  string add_to = "hello.";
  const string add_on = "baby";
  const char *cfirst = add_to.c_str();
  const char *csecond = add_on.c_str();

  char *copy = new char[strlen(cfirst) + strlen(csecond) + 1];

  strcpy(copy, cfirst);
  strcat(copy, csecond);

  cout << "copy = " << copy << endl;

  add_to = copy;
  delete [] copy;
  cout << "add_to = "  << add_to << endl;

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

