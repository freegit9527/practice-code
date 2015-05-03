#!/usr/bin/env perl 
#===============================================================================
#         FILE: net_pcap.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/03/2015 09:39:00 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Net::Pcap;

die "You should be root...\n" if $>;

sub process_packet {
    my ($user_data, $header, $packet) = @_;
    print "#" x 20 . "\n";
    print "user_data is $user_data\n";
    print "header is $header\n";
    print "packet is $packet\n";
    print "#" x 20 . "\n";
}

my $err;
my $device = Net::Pcap::lookupdev(\$err);

print "device is: $device\n";

my $pcap = pcap_open_live($device, 1024, 1, 0, \$err);

#pcap_loop($pcap, 3, \&process_packet, "just for the demo");

pcap_close($pcap);

my ($net, $mask);

if (pcap_lookupnet($device, \$net, \$mask, \$err) == 0) {
    print "net is: $net\n";
    print "mask is: $mask\n";
}

__END__

my %devinfo;
my @devs = pcap_findalldevs(\%devinfo, \$err);
for (@devs) {
    print "$_ : $devinfo{$_}\n";
}

