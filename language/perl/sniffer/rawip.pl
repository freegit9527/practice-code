#!/usr/bin/env perl 
#===============================================================================
#         FILE: rawip.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/03/2015 06:26:43 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Net::RawIP;

my $packet = new Net::RawIP;

$packet->set({
        ip => {
            saddr => '192.168.1.1',
            daddr => '192.168.1.2'
           },
        tcp => {
            source  => 2323,
            dest    => 23,
            ack     => 1,
            seq     => 10000000,
            ack_seq => 10000000,
            data    => 'Testing Net::RawIP'
        }
});

$packet->send(0, 1);
