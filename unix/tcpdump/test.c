/*
 * =====================================================================================
 *       Filename : test1.c
 *    Description : 
 *    Version     : 
 *        Created : 04/15/15 15:34
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <pcap.h>
#include <stdio.h>
#include <time.h>
#include <stdlib.h>

void getPacket(u_char *arg, const struct pcap_pkthdr *pkthdr, const u_char * packet)
{
  int *id = (int*)arg;

  printf ( "id: %d\n", ++(*id) );
  printf("Packet length: %d\n", pkthdr->len);  
  printf("Number of bytes: %d\n", pkthdr->caplen);  
  printf("Recieved time: %s", ctime((const time_t *)&pkthdr->ts.tv_sec));   
    
  int i;  
  for(i=0; i<pkthdr->len; ++i)  
  {  
    printf(" %02x", packet[i]);  
    if( (i + 1) % 16 == 0 )  
    {  
      printf("\n");  
    }  
  }  
    
  printf("\n\n");  
}

int main()  
{  
  char errBuf[PCAP_ERRBUF_SIZE], * devStr;  
    
  devStr = pcap_lookupdev(errBuf);  
    
  if(devStr)  
  {  
    printf("success: devStr: %s\n", devStr);  
  }  
  else  
  {  
    printf("error: %s\n", errBuf);  
  }  

  pcap_t * device = pcap_open_live(devStr, 65535, 1, 0, errBuf);

  if (!device) {
    printf ( "error: pcap_open_live(): %s\n", errBuf );
    exit(1);
  }

  struct pcap_pkthdr packet;
  const u_char * pktStr = pcap_next(device, &packet);

  if ( !pktStr ) {
    printf ( "did not capture a packet!\n" );
    exit(1);
  }

  printf ( "Packet length: %d\n", packet.len );
  printf ( "Number of bytes: %d\n", packet.caplen );
  printf ( "Recived time: %s\n", ctime((const time_t *)&packet.ts.tv_sec) );

  int id = 0;
  pcap_loop(device, -1, getPacket, (u_char*)&id);

  pcap_close(device);
    
  return 0;  
}  

