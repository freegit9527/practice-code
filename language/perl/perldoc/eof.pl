#!/usr/bin/env perl 
#===============================================================================
#         FILE: eof.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/21/2015 04:56:22 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;


while (<>) {
    while (<ARGV>) {
        next if /^\s*#/ or /^\s*$/;
        print "$.\t $_";
    }
    if (eof()) {
        print "-" x 20, "\n";
    }
#    last if eof();
}
