#!/usr/bin/env perl 
#===============================================================================
#         FILE: alldev.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/04/2015 09:37:48 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use Net::Pcap;
use 5.014;

my $err;

my @lst = Net::Pcap::findalldevs(\$err);

print "@lst";
