/*
 * =====================================================================================
 *       Filename : split.cpp
 *    Description : 
 *    Version     : 
 *        Created : 04/21/15 00:15
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <string>
#include <cstdlib>
#include <cstdio>

using namespace std;


  int
main ( int argc, char *argv[] )
{
  freopen("in.txt", "r", stdin);
  string str;
  while (getline(cin, str)) {
    cout << str << str.length() <<  endl;
    const char * cstr = str.c_str();
    char *buf = new char[str.length() + 1];
    strcpy(buf, cstr);
    
    char *p[3];
    int cnt = 0;
    char * lasts;
    p[cnt] = strtok_r(buf, " ", &lasts);
    ++cnt;
    while (NULL != (p[cnt] = strtok_r(NULL, "\n ", &lasts))) {
      ++cnt;
    }
//    cout << "cnt = " << cnt << endl;

//    for ( int i = 0; i < cnt; ++i ) {
//      cout << ">" << p[i] << "<"  << endl;
//    }
  }

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

