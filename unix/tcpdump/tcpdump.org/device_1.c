/*
 * =====================================================================================
 *       Filename : device_1.c
 *    Description : 
 *    Version     : 
 *        Created : 05/01/15 09:33
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
	#include <stdio.h>
	#include <pcap/pcap.h>

	int main(int argc, char *argv[])
	{
		char *dev, errbuf[PCAP_ERRBUF_SIZE];

		dev = pcap_lookupdev(errbuf);
		if (dev == NULL) {
			fprintf(stderr, "Couldn't find default device: %s\n", errbuf);
			return(2);
		}
		printf("Device: %s\n", dev);
		return(0);
	}
