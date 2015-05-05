#!/usr/bin/env perl 
#===============================================================================
#         FILE: play_with_pack.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/05/2015 04:02:31 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;
require Tk::BrowseEntry;

if ($#ARGV >= 0)
{
    $numWidgets = $ARGV[0];
}
else 
{
    $numWidgets = 4;
}

my $mw = MainWindow->new(
    -title => "Play w/pack",
);

my $f = $mw->Frame(
    -boderwidth => 2,
    -relief => 'groove',
)->pack(
    -side => 'top',
    -fill => 'x',
);

my (@packdirs) = ();

my $i = 0;

for (0..$numWidgets) 
{
    $packdirs[$_] = 'top';
}


MainLoop;


