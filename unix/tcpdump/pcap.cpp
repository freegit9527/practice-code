/*
 * =====================================================================================
 *       Filename : pcap.cpp
 *    Description : 
 *    Version     : 
 *        Created : 04/14/15 17:55
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <pcap.h>
#include <stdlib.h>


  int
main ( int argc, char *argv[] )
{
  char *dev = argv[1];

  printf ( "Device: %s\n", dev );

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

