#!/usr/bin/env perl 
#===============================================================================
#         FILE: reverserHash.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/24/2015 19:56:50
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my %my_hash = qw (
    breakfast cese
    lunch sandwich
    dinner pie
);

my %reverse_h = reverse %my_hash;

for my $key (keys %reverse_h) {
    say "$key => $reverse_h{$key}";
}
