#!/usr/bin/env perl 
#===============================================================================
#         FILE: tcp_test.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/05/2015 04:45:11 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;

my $mw = MainWindow->new;

$mw->geometry("500x500");

$mw->title("TCP CAPTURE TOOL");

my $main_frame = $mw->Frame()->pack(
    -side => 'top',
    -fill => 'x',
);

my $device_frame = $main_frame->Frame()->pack(
    -side => 'left',
    -anchor => 'n',
);


$device_frame->Label
(
    -text => "Device Name:",
    -background => 'white',
    -foreground => 'black',
)->pack
(
    -side => 'left',
    -anchor => 'w',
    -expand => 1,
);

MainLoop;
