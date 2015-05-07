#!/usr/bin/env perl 
#===============================================================================
#         FILE: tcp.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/05/2015 04:26:18 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;
use Net::Pcap;
use NetPacket::Ethernet;
use NetPacket::IP;
use NetPacket::TCP;

if ($>)
{
#    die "You are not root...\n";
}

#   Create packet capture object on device

my $object;

# error message
my $err;

# device name
my $dev;

# ip address and netmask
my ($address, $netmask);

# store packet filter 
my $filter;

my $mw = MainWindow->new;

$mw->geometry("500x580");

$mw->title("TCP CAPTURE TOOL");

# create frames:
# main_frame, top_frame, device_frame, center_frame,
# bottom_frame

my $main_frame = $mw->Frame()->pack 
(
    -side => 'top',
    -fill => 'both',
);
 
my $top_frame = $main_frame->Frame 
(
    -background => 'red',
)->pack
(
    -side => 'top',
    -fill => 'x',
);

my $device_frame = $main_frame->Frame
(
    -background => "white",
)->pack 
(
    -side => 'top',
    -fill => 'x',
);

my $number_frame = $main_frame->Frame
(
    -background => "white",
)->pack 
(
    -side => 'top',
    -fill => 'x',
);

my $center_frame = $main_frame->Frame(
    -background => "white",
)->pack 
(
    -side => 'top',
    -fill => 'both',
);

my $bottom_frame = $main_frame->Frame
(
    -background => "white",
)->pack
(
    -side => "bottom",
    -fill => 'both',
    -expand => 1,
    -anchor => 's',
);

# Insert widgets into frames...

$top_frame->Label
(
    -text => "CATCH PACKETS",
    -background => "red",
)->pack 
(
    -side => "top",
);

$device_frame->Label
(
    -text => "Device Name:",
    -background => 'white',
    -foreground => 'black',
)->pack
(
    -side => 'left',
    -anchor => 'w',
    -expand => 1,
);

my $device_entry = $device_frame->Entry
(
    -background => 'white',
    -foreground => 'black',
)->pack 
(
    -side => "left",
    -fill => 'x',
    -expand => 1,
    -anchor => 'w',
);

my $device_button = $device_frame->Button 
(
    -text => "Get Device",
    -command => \&getdevice,
)->pack 
(
    -side => "right",
    -before => $device_entry,
    -expand => 1,
    -fill => 'x',
);

my $number_entry = $number_frame->Entry 
(
    -background => 'white',
    -foreground => 'black',
)->pack 
(
    -side => "right",
    -fill => 'x',
    -expand => 1,
    -anchor => 'w',
);

my $number_label = $number_frame->Label
(
    -text => "Number of Packets:",
    -background => 'white',
    -foreground => 'black',
)->pack 
(
    -side => 'left',
    -anchor => 'w',
    -expand => 1,
);


$center_frame->Label
(
    -text => "Captured Packets:",
    -background => 'white',
    -foreground => 'black',
)->pack
(
    -side => 'top',
    -anchor => 'w',
    -expand => 1,
);

my $packet_content = $center_frame->Text 
(
    -background => 'white',
    -foreground => 'black',
)->pack 
(
    -side => "top",
    -expand => 1,
    -fill => 'x',
    -anchor => 'w',
);

my $start_button = $bottom_frame->Button(
    -text => "START",
    -command => \&start_entry,
)->pack 
(
    -side => "left",
    -expand => 1,
    -fill => 'both',
    -anchor => 'w',
);

my $clear_button = $bottom_frame->Button(
    -text => "CLEAR",
    -command => \&clear_entry,
)->pack 
(
    -side => "left",
    -expand => 1,
    -fill => 'both',
    -anchor => 'w',
);

my $bottom_button = $bottom_frame->Button (
    -text => "EXIT",
    -command => sub 
    {
        exit;
    }
)->pack 
(
    -side => "right",
    -anchor => "e",
    -fill => 'both',
    -expand => 1,
);


MainLoop;

sub clear_entry 
{
    $packet_content->delete('0.0', 'end');
}

sub start_entry
{
#   Look up network address information about network 
#   device using Net::Pcap::lookupnet - This also acts as a 
#   check on bogus network device arguments that may be 
#   passed to the program as an argument

    if (Net::Pcap::lookupnet($dev, \$address, \$netmask, \$err)) 
    {
        die 'Unable to look up device information for ', $dev, ' - ', $err;
    }

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

    Net::Pcap::compile(
        $object, 
        \$filter,
        '(dst 10.63.68.180) && (tcp[13] & 2 != 0)', 
#        '(dst 127.0.0.1) && (tcp[13] & 2 != 0)', 
        0, 
        $netmask
    ) 
    &&
    die 'Unable to compile packet capture filter';

    Net::Pcap::setfilter($object, $filter) &&
        die 'Unable to set packet capture filter';

#   Set callback function and initiate packet capture loop

    Net::Pcap::loop($object, 10, \&syn_packets, '') ||
        die 'Unable to perform packet capture';

    Net::Pcap::close($object);

#    $dev= $device_entry->get();
#    $packet_content->insert("end", $dev);
}

#   Use network device entered in device_entry or if no 
#   device is entered, determine an appropriate network 
#   device for packet sniffing using the 
#   Net::Pcap::lookupdev method by click the device_button

sub getdevice 
{
    $dev = Net::Pcap::lookupdev(\$err);
    if (defined $err) 
    {
        die 'Unable to determine network device for monitoring - ', $err;
    }
    $device_entry->delete('0.0', 'end');
    $device_entry->insert("end", $dev);
}

sub syn_packets 
{
    my ($user_data, $header, $packet) = @_;

    #   Strip ethernet encapsulation of captured packet 

    my $ether_data = NetPacket::Ethernet::strip($packet);

    #   Decode contents of TCP/IP packet contained within 
    #   captured ethernet packet

    my $ip = NetPacket::IP->decode($ether_data);
    my $tcp = NetPacket::TCP->decode($ip->{'data'});

    #   Print all out where its coming from and where its 
    #   going to!

    $packet_content->insert("end", 
        $ip->{'src_ip'}. ":". $tcp->{'src_port'}. " -> ".
        $ip->{'dest_ip'}. ":". $tcp->{'dest_port'}. "\n"
    );

   # tcp fileds.
   
    $packet_content->insert("end", 
      "seqnum: $tcp->{seqnum}\n".
      "acknum: $tcp->{acknum}\n"
    );

#    # tcp fileds.
#    
#    print 
#      "seqnum: $tcp->{seqnum}\n",
#      "acknum: $tcp->{acknum}\n";

    if ($tcp->{flags} & SYN) 
    {
        print 
          "SYN: 1";
    }
    else 
    {
        print 
          "SYN: 0";
    }
    print "\n";

    if ($tcp->{flags} & FIN) 
    {
        print 
          "FIN: 1";
    }
    else 
    {
        print 
          "FIN: 0";
    }

    print "\n";
}

