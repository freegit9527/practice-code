#!/usr/bin/env perl 
#===============================================================================
#         FILE: font.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/04/2015 09:40:30 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

print "Please type a font name\n";

my $font = <>;

chomp $font;

print "Please type a file name\n";

my $filename = <>;

chomp $filename;

print "Type <1> to fax, <2> to print\n";

my $option = <>;

chomp $option;

if ($option eq 1)
{
    print "Faxing $filename in font $font\n";
}
elsif ($option eq 2)
{
    print "Now sending $filename to printer".
    " in font $font\n";
}
