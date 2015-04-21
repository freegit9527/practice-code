#!/usr/bin/env perl 
#===============================================================================
#         FILE: declaration.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/21/2015 03:18:49 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

$a += 1;
if ( $a ) {
    print "a is defined.\n";
} else {
    print "a is not defined.\n";
}

undef $a;
$a++;

if ( $a ) {
    print "a is defined.\n";
} else {
    print "a is not defined.\n";
}
say $a;

print $_, " " for qw(world dolly nurse);
my $i = 0;
print $i++ while $i <= 10;

print "\n", "=" x 20, "\n";
open SELF, "declaration.pl";
LINE: while (<SELF>) {
    next LINE if /^#/ or /^\s+$/;
    print;
}
