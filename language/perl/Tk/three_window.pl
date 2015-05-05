#!/usr/bin/env perl 
#===============================================================================
#         FILE: three_window.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/04/2015 10:24:23 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;

my $mw = MainWindow->new;

fill_window($mw, "Main");

my $top1 = $mw->Toplevel;

my $top2 = $mw->Toplevel;

fill_window($top1, "First top-level");
fill_window($top2, "Second top-level");

MainLoop;


sub fill_window
{
    my ($window, $header) = @_;

    $window->Label(-text => $header)->pack;

    $window->Button(
        -text => "close",
        -command => [$window => "destroy"]
    )->pack(-side => 'left');

    $window->Button (
        -text => 'exit',
        -command => [$mw => 'destroy']
    )->pack(-side => 'right');
}
