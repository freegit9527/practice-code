#!/usr/bin/env perl 
#===============================================================================
#         FILE: 3.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 07:29:47 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.020;

while (<>) {
    my $hash;
    while ($_ --) {
        my $line;
        chomp($line = <>);
        $line =~ /(http:\/\/[^\/]*)(.*)/;
        #print $1, "-->", $2, "\n";
        push @{$hash->{$1}}, $2;
    }
    for (keys %{$hash}) {
        @{$hash->{$_}} = sort {$a cmp $b} @{$hash->{$_}};
    }
    for (keys %{$hash}) {
        for my $j (keys %{$hash}) {
            if (array_cmp($hash->{$_}, $hash->{$j})) {

            }
        }
    }
}

exit 0;
