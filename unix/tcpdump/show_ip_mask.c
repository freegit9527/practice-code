/*
 * =====================================================================================
 *       Filename : show_ip_mask.c
 *    Description : 
 *    Version     : 
 *        Created : 04/20/15 17:12
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include <pcap.h>
#include <time.h>
#include <netinet/in.h>
#include <arpa/inet.h>


/*  Name:  show_ip_mask
 *  Description:  
 */
  void
show_ip_mask ( char *dev )
{
  char errbuf[1024];

  bpf_u_int32 netp, maskp;
  int err = pcap_lookupnet(dev, &netp, &maskp, errbuf);
  if ( -1 == err ) {
    printf ( "couldn't detect the ip and maskp: %s\n", errbuf );
    return;
  }

  // show ip
  struct in_addr addr;
  addr.s_addr = netp;
  char * net = inet_ntoa(addr);
  if ( NULL == net ) {
    printf ( "ip error!\n" );
    return;
  }
  printf ( "ip: %s\n", net );

  // show mask
  addr.s_addr = maskp;
  char * mask = inet_ntoa(addr);
  if ( NULL == mask ) {
    printf ( "mask error!\n" );
    return;
  }
  printf ( "mask: %s\n", mask );

  return ;
}		/* -----  end of function show_ip_mask  ----- */

  int
main ( int argc, char *argv[] )
{
  char *dev, errbuf[1024];
  char select = 'a';
  printf ( "select(display the packet in detail):(Y/N ?) " );
  scanf ( "%c", &select );
  while ( select != 'Y' && select != 'N'
      && select != 'y' && select != 'n') {
    printf ( "input the error!\nplease input the Y/N/y/n: " );
    scanf ( "%c", &select );
  }

  dev = pcap_lookupdev(errbuf);
  if ( NULL == dev ) {
    printf ( "couldn't find default device: %s\n", errbuf );
    return 1;
  }
  else {
    printf ( "find success: device :%s\n", dev );
  }

  show_ip_mask(dev);

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

