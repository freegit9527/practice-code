#!/usr/bin/env perl 
#===============================================================================
#         FILE: ref.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/03/2015 11:11:11 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
my $ref = \@ARGV;
my $cnt = scalar(@$ref);
say "address of ARGV is " . \@ARGV;
print "ref points to $ref\n";
my $i = 0;
print "There are $cnt items...\n";
for (@$ref) {
    print "$i: $_\n";
    $i += 1;
}


