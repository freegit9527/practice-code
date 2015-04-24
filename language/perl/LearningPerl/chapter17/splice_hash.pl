#!/usr/bin/env perl 
#===============================================================================
#         FILE: splice_hash.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/24/2015 21:33:30
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

$\ = $/;
my %score = qw (
    lxy 90
    barney 0
);

print "$_ => $score{$_}" for (keys %score);
print "=" x 20;
my @players = qw / barney fred dino /;
my @bowling_scores = (195, 205, 30);
@score{@players} = @bowling_scores;

print "$_ => $score{$_}" for (keys %score);
