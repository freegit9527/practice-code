#!/usr/bin/env perl 
#===============================================================================
#         FILE: tinycap.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/03/2015 09:07:50 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use Net::PcapUtils;
use 5.014;

Net::PcapUtils::loop(\&process_pkt,
  SNAPLEN => 65536,
  PROMISC => 1,);


sub process_pkt {
    my (undef, undef, $packet) = @_;
    print("Got a packet!\n");
    print ("A packet: \n#####\n" . $packet . "#####\n");
}



