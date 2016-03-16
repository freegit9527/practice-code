#!/usr/bin/env perl 
#===============================================================================
#         FILE: rename_file.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 10:59:56 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my @files = glob "[1-5].txt";
for (@files) {
    my $new_file = (split //)[0];
    rename $_, $new_file or warn "failed on $_: $!\n";
    say "rename $_ with success";
}


