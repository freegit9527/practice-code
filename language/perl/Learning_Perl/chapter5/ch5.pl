#!/usr/bin/env perl 
#===============================================================================
#         FILE: ch5.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 08:50:17 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my $file_name = "logfile";
open LOG, "> $file_name";
say LOG "Hello, liuxueyang~";
close LOG;

open LOG, '>>', "$file_name";
say LOG "Hello, LIU~";
say LOG "Hello, xue~";
say LOG "Hello, yang~";
say LOG "Hello, ... Hey~";
close LOG;

say "*" x 10;
open STDIN, '<', 'logfile';
while (<>) {
    chomp;
    say $., ": ", $_;
}
#open LOG, "$file_name";
#say readline LOG;
#close LOG;

#unlink $file_name;
