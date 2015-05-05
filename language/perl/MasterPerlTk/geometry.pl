#!/usr/bin/env perl 
#===============================================================================
#         FILE: geometry.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/05/2015 11:20:34 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;

my $mw = MainWindow->new;

$mw->title("Bad window");
$mw->Label(
    -text => "This is a example of a window" .
    " that looks bad\nwhen you do not " .
    "send any options to pack"
)->pack;

$mw->Checkbutton(
    -text => "I like it!"
)->pack(
    -side => "left"
);

$mw->Checkbutton(
    -text => "I hate it!"
)->pack(
    -side => "left"
);

$mw->Checkbutton(
    -text => "I do not care"
)->pack(
    -side => "left"
);

$mw->Button(
    -text => "Exit",
    -command => sub 
    {
        exit
    }
)->pack(
    -side => "bottom"
);


MainLoop;
