/*
 * =====================================================================================
 *       Filename : testpcap1.c
 *    Description : 
 *    Version     : 
 *        Created : 04/24/15 09:50
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include <pcap.h>
#include <errno.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netinet/if_ether.h>


  int
main ( int argc, char *argv[] )
{
  int i;
  char *dev;
  char errbuf[PCAP_ERRBUF_SIZE];
  pcap_t *descr;
  const u_char *packet;
  struct pcap_pkthdr hdr;
  struct ether_header *eptr;
  u_char *ptr;

  dev = pcap_lookupdev(errbuf);

  if ( dev == NULL ) {
    printf ( "%s\n", errbuf );
    exit(1);
  }
  printf ( "DEV: %s\n", dev );

  descr = pcap_open_live(dev, BUFSIZ, 0, -1, errbuf);

  if ( descr == NULL ) {
    printf ( "pcap_open_live(): %s\n", errbuf );
    exit(1);
  }
  packet = pcap_next(descr, &hdr);
  printf ( "Recieved at ..... %s\n", ctime((const time_t *)
        &hdr.ts.tv_sec) );
  printf ( "Ethernet address length is %d\n", ETHER_HDR_LEN );

  eptr = (struct ether_header *) packet;

  if ( ntohs(eptr->ether_type) == ETHERTYPE_IP ) {
    printf ( "Ethernet type hex:%x dec:%d is an IP packet\n",
        ntohs());
  }
  else {
    <-ELSE_PART->
  }

  if ( NULL == packet ) {
    printf ( "Didn't grab packet\n" );
    exit(1);
  }

  printf ( "Grabbed packet of length %d\n", hdr.len );

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

