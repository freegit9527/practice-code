#!/usr/bin/env perl 
#===============================================================================
#         FILE: tcp.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/05/2015 04:26:18 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;

my $mw = MainWindow->new;

$mw->geometry("500x500");

$mw->title("TCP CAPTURE TOOL");

my $main_frame = $mw->Frame()->pack 
(
    -side => 'top',
    -fill => 'both',
);

my $device_frame = $main_frame->Frame
(
    -background => "white",
)->pack 
(
    -side => 'top',
    -fill => 'x',
);

my $center_frame = $main_frame->Frame(
    -background => "white",
)->pack 
(
    -side => 'top',
    -fill => 'y',
);

my $bottom_frame = $main_frame->Frame
(
    -background => "white",
)->pack
(
    -side => "bottom",
    -expand => 1,
    -anchor => 's',
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

$device_frame->Entry
(
    -background => 'white',
    -foreground => 'black',
)->pack 
(
    -side => "right",
    -fill => 'x',
    -expand => 1,
    -anchor => 'e',
);


$center_frame->Label
(
    -text => "Captured Packets:",
)->pack
(
    -side => 'top',
    -anchor => 'w',
    -expand => 1,
);

$center_frame->Text 
(
    -background => 'black',
    -foreground => 'white',
)->pack 
(
    -side => "top",
    -expand => 1,
    -fill => 'x',
    -anchor => 'w',
);

$bottom_frame->Button(
    -text => "START",
)->pack 
(
    -side => "left",
    -expand => 1,
    -fill => 'x',
    -anchor => 'w',
);

$bottom_frame->Button (
    -text => "EXIT",
    -command => sub 
    {
        exit;
    }
)->pack 
(
    -side => "right",
    -anchor => "e",
    -fill => 'x',
    -expand => 1,
);


MainLoop;
