/*
 * =====================================================================================
 *       Filename : device.cpp
 *    Description : 
 *    Version     : 
 *        Created : 04/14/15 17:58
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
  char *dev, errbuf[PCAP_ERRBUF_SIZE];

  dev = pcap_lookupdev(errbuf);
  if ( dev == NULL ) {
    fprintf(stderr, "Couldn't find default device: %s\n", errbuf);
    return (2);
  }
  printf ( "Device: %s\n", dev );

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

