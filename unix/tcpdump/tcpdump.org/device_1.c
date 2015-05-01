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

    pcap_t *handle;

    handle = pcap_open_live(dev, BUFSIZ, 1, 1000, errbuf);
    if ( NULL == handle ) {
      fprintf(stderr, "Couldn't open device %s: %s\n", dev, errbuf);
      return 2;
    }

    struct bpf_program fp;
    char filter_exp[] = "port 80";
    bpf_u_int32 mask, net;
    if ( pcap_lookupnet(dev, &net, &mask, errbuf) == -1 ) {
      fprintf(stderr, "Can't get netmask for device %s\n", dev);
      net = 0;
      mask = 0;
    }
    if ( NULL == handle ) {
      fprintf(stderr, "Couldn't open device %s: %s\n", dev, errbuf);
      return 2;
    }
    if ( pcap_compile(handle, &fp, filter_exp, 0, net) == -1 ) {
      fprintf(stderr, "Couldn't parse filter %s: %s\n", filter_exp, pcap_geterr(handle));
      return 2;
    }
    if ( pcap_setfilter(handle, &fp) == -1 ) {
      fprintf(stderr, "Couldn't install filter %s: %s\n", filter_exp, pcap_geterr(handle));
      return 2;
    }

    struct pcap_pkthdr header;
    const u_char *packet;
    packet = pcap_next(handle, &header);
    printf("Jacked a packet with length of [%d]\n", header.len);
    pcap_close(handle);
		return(0);
	}
