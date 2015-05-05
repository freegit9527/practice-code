#!/usr/bin/env perl 
#===============================================================================
#         FILE: allocation.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/05/2015 02:53:50 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;

my $mw = MainWindow->new;

$mw->geometry("300x300");

$mw->Button(
    -text => "LEFT"
)->pack(
    -side => 'left',
    -fill => 'both',
    -expand => 1,
    -anchor => 'w',
);

$mw->Button(
    -text => "RIGHT"
)->pack(
    -side => 'right',
    -fill => 'both',
    -expand => 1,
    -anchor => 'w',
);


$mw->Button(
    -text => "TOP"
)->pack(
    -side => 'top',
    -fill => 'both'
);

$mw->Button(
    -text => "BOTTOM",
    -command => sub 
    {
        exit;
    }
)->pack(
    -side => 'bottom',
    -fill => 'both'
);

MainLoop;
