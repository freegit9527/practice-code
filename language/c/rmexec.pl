#!/usr/bin/env perl 
#===============================================================================
#         FILE: a.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/16/2015 09:50:30 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

for my $f (glob "*") {
    if (-f $f)
    {
        unlink $f unless $f =~ /.*\.pl/;
    }
}


