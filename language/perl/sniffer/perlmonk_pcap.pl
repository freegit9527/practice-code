#!/usr/bin/env perl 
#===============================================================================
#         FILE: perlmonk_pcap.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/06/2015 09:24:54 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Net::Pcap;

die "You are not root" if ($>);
my $err;
my $dev = Net::Pcap::lookupdev(\$err);
if ($err) {die "unable to determin network device for monitoring.";}
my ($address, $netmask);
if (Net::Pcap::lookupnet($dev, \$address, \$netmask, \$err)) {
    die "unable to look up device info...";
}
print "$dev: addr/mask -> $address/$netmask\n";


