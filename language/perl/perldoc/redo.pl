#!/usr/bin/env perl 
#===============================================================================
#         FILE: redo.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/21/2015 04:19:37 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

while (<>) {
    chomp;
    if ( s/\\$// ) {
        $_ .= <>;
        redo unless eof();
    }
    print;
    last if eof();
}


