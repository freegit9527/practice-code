#!/usr/bin/env perl 
#===============================================================================
#         FILE: page47.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/24/2015 05:25:48 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my %gilligan_info = (
    name     => 'Gilligan',
    hat      => 'White',
    shirt    => 'Red',
    position => 'First Mate',
);
my $hash_ref = \%gilligan_info;

my %skipper_info = (
    name     => 'Skipper',
    hat      => 'Black',
    shirt    => 'Blue',
    position => 'Captain',
);

my @crew = (\%gilligan_info, \%skipper_info);

print $$hash_ref{'name'}, "\n";
say $hash_ref->{'hat'};

say $crew[0]->{'name'};
say $crew[0]{'name'};

say ${$crew[0]}{'name'};
my $ref = $crew[0]; say $$ref{'name'};

my $format = "%-15s %-7s %-7s %-15s\n";
