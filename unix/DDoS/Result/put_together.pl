#!/usr/bin/env perl 
#===============================================================================
#         FILE: put_together.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/04/2015 03:24:43 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use Net::Pcap;
use NetPacket::Ethernet;
use NetPacket::IP;
use NetPacket::TCP;
use IO::Handle;
use Tk;
#use vars (%uniq_srcip);

$| = 1;

my $THRESHOLD = 100;

my %uniq_srcip;

my $logdir = "./log";

if (! -d $logdir) 
{
    print "Creating log directory $logdir\n\n";
    mkdir $logdir, 0755;
}

my $LISTFILE = "$logdir/bannedips.txt";

my @date = localtime();

my $weekday = $date[6];

my $log_handle;

open($log_handle, "> $logdir/log.$weekday.txt");

$log_handle->autoflush(1);

if ($>)
{
    die "You are not root...\n";
}

my $err;

#   Use network device passed in program arguments or if no 
#   argument is passed, determine an appropriate network 
#   device for packet sniffing using the 
#   Net::Pcap::lookupdev method

my $dev = $ARGV[0];

my $packet_num = 0;

unless (defined $dev) 
{
    $dev = Net::Pcap::lookupdev(\$err);
    if (defined $err) 
    {
        die 'Unable to determine network device for monitoring - ', $err;
    }
}

print "listenging to device: $dev\n";
print $log_handle "listenging to device: $dev\n";

#   Look up network address information about network 
#   device using Net::Pcap::lookupnet - This also acts as a 
#   check on bogus network device arguments that may be 
#   passed to the program as an argument

my ($address, $netmask);
if (Net::Pcap::lookupnet($dev, \$address, \$netmask, \$err)) 
{
    die 'Unable to look up device information for ', $dev, ' - ', $err;
}

#   Create packet capture object on device

my $object;
$object = Net::Pcap::open_live($dev, 1500, 0, 0, \$err);
unless (defined $object) 
{
    die 'Unable to create packet capture on device ', $dev, ' - ', $err;
}

#   Compile and set packet filter for packet capture 
#   object - For the capture of TCP packets with the SYN 
#   header flag set directed at the external interface of 
#   the local host, the packet filter of '(dst IP) && (tcp
#   [13] & 2 != 0)' is used where IP is the IP address of 
#   the external interface of the machine.  For 
#   illustrative purposes, the IP address of 127.0.0.1 is 
#   used in this example.

my $filter;
Net::Pcap::compile(
    $object, 
    \$filter,
#    '(dst 192.168.1.105) && (tcp[13] & 2 != 0)', 
    '(dst 127.0.0.1) && (tcp[13] & 2 != 0)', 
    0, 
    $netmask
) 
&&
die 'Unable to compile packet capture filter';

Net::Pcap::setfilter($object, $filter) &&
    die 'Unable to set packet capture filter';

#   Set callback function and initiate packet capture loop

Net::Pcap::loop($object, -1, \&syn_packets, '') ||
    die 'Unable to perform packet capture';

Net::Pcap::close($object);


sub syn_packets 
{
#    state $num = 0;
    my ($user_data, $header, $packet) = @_;

    #   Strip ethernet encapsulation of captured packet 

    my $ether_data = NetPacket::Ethernet::strip($packet);

    #   Decode contents of TCP/IP packet contained within 
    #   captured ethernet packet

    my $ip = NetPacket::IP->decode($ether_data);
    my $tcp = NetPacket::TCP->decode($ip->{'data'});

    if (defined $uniq_srcip{$ip->{'src_ip'}}) 
    {
        $uniq_srcip{$ip->{'src_ip'}} += 1;
    }
    else 
    {
        $uniq_srcip{$ip->{'src_ip'}} = 1;
    }

    #   Print all out where its coming from and where its 
    #   going to!

#    print "NO $num: ";
    print "NO. $packet_num: ";
    print $log_handle "NO. $packet_num: ";

    print
        $ip->{'src_ip'}, ":", $tcp->{'src_port'}, " -> ",
        $ip->{'dest_ip'}, ":", $tcp->{'dest_port'}, "\n";

    # tcp fileds.
    
#    print 
#      "seqnum: $tcp->{seqnum}\n",
#      "acknum: $tcp->{acknum}\n";
#
#    print $log_handle
#      "seqnum: $tcp->{seqnum}\n",
#      "acknum: $tcp->{acknum}\n";

#    $num++;
    $packet_num++;
    if ($tcp->{flags} & SYN) 
    {
        print 
          "SYN: 1";

        print $log_handle
          "SYN: 1";
    }
    else 
    {
        print 
          "SYN: 0";

        print $log_handle
          "SYN: 0";
    }
    print "\n";
    print $log_handle "\n";


    if ($tcp->{flags} & FIN) 
    {
        print 
          "FIN: 1";

        print $log_handle
          "FIN: 1";
    }
    else 
    {
        print 
          "FIN: 0";

        print $log_handle
          "FIN: 0";
    }

    print "\n\n";

    print $log_handle "\n\n";

    print "src_ip\t\tnumOfConnections\n";

    print $log_handle "src_ip\t\tnumOfConnections\n";

    open(LIST, "> $LISTFILE");

    LIST->autoflush(1);

    print LIST "src_ip\t\tnumOfConnections\n";

    for my $k (keys %uniq_srcip) 
    {
        print "$k\t\t$uniq_srcip{$k}\n";

        print $log_handle "$k\t\t$uniq_srcip{$k}\n";

        if ($uniq_srcip{$k} > $THRESHOLD) {
            print LIST "$k\t\t$uniq_srcip{$k}\n";
        }
    }
    close(LIST);

    print "\n";
    print "=" x 20 . "\n\n";

    print $log_handle "\n";
    print $log_handle "=" x 20 . "\n\n";
}

__END__
my $mw = MainWindow->new;

$mw->Label(-text => 'Hello, World...')->pack;

$mw->Button(
    -text    => 'Quit',
    -command => sub {exit},
)->pack;


$mw->Button(
    -text    => 'Enter',
    -command => sub {print "Hey..\n"},
)->pack;

MainLoop;
