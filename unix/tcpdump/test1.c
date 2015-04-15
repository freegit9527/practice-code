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
#include <stdlib.h>

int main()  
{  
  char errBuf[PCAP_ERRBUF_SIZE], * device;  
    
  device = pcap_lookupdev(errBuf);  
    
  if(device)  
  {  
    printf("success: device: %s\n", device);  
  }  
  else  
  {  
    printf("error: %s\n", errBuf);  
  }  
    
  return 0;  
}  
