#!/usr/bin/env perl 
#===============================================================================
#         FILE: pack.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/04/2015 10:05:24 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;

my $mw = MainWindow->new;

$mw->title("The MainWindow");

# Take top and the bottom - now implicit 
# top is in the middle.
#

$mw->Label(-text => "At the top (default)")->pack;
$mw->Label(-text => "At the bottom")->pack(
            -side => 'bottom');
$mw->Label(-text => "The middle remains")->pack;

# Since left and right are take, bottom will 
# not work..

my $top1 = $mw->Toplevel;

$top1->title("Toplevel 1");

$top1->Label(-text => "Left")->pack(-side => 
    "left");
$top1->Label(-text => "Right")->pack(-side => 
    "right");
$top1->Label(-text => "?Bottom?")->pack(-side => 
    "bottom");


# But when you use Frames, things work quite 
# alright.

my $top2 = $mw->Toplevel;

$top2->title("Toplevel 2");

my $frame = $top2->Frame;

$frame->pack;

$frame->Label(-text => "Left2")->pack(-side =>
    'left');
$frame->Label(-text => "Right2")->pack(-side =>
    'right');
$top2->Label(-text => "Bottom2")->pack(-side =>
    'bottom');

MainLoop;
