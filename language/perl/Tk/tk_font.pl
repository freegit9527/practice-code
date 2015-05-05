#!/usr/bin/env perl 
#===============================================================================
#         FILE: tk_font.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/04/2015 09:45:08 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;

my $mw = MainWindow->new;

# print and fax Button
#

$mw->Label(-text => 'File Name')->pack;

my $filename = $mw->Entry(-width => 20);

$filename->pack;


$mw->Label(-text => 'Font Name')->pack;

my $font = $mw->Entry(-width => 10);

$font->pack;


$mw->Button (
    -text => 'Fax',
    -command => sub 
    {
        do_fax($filename, $font);
    }
)->pack;

$mw->Button (
    -text => 'Print',
    -command => sub 
    {
        do_print($filename, $font);
    }
)->pack;

$mw->Button (
    -text => 'Exit', 
    -command => sub 
    {
        exit;
    }
)->pack;

# Listbox

my $box = $mw->Listbox(
    -relief => 'sunken',
    -height => 5,
    -setgrid => 1,
);

my @items = qw (
One Two Three 
Four Five Six
Seven Eight Nine
Ten Eveven Twelve
);

for (@items) {
    $box->insert('end', $_);
}

my $scroll = $mw->Scrollbar(-command => ['yview', $box]);

$box->configure(-yscrollcommand => ['set', $scroll]);

$box->pack(-side => 'left', -fill => 'both', -expand => 1);

$scroll->pack(-side => 'right', -fill => 'y');

# three windows

fill_window($mw, "Main");

my $top1 = $mw->Toplevel;

my $top2 = $mw->Toplevel;

fill_window($top1, "First top-level");
fill_window($top2, "Second top-level");

# position
#

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

$top1->title("Toplevel 1");

$top1->Label(-text => "Left")->pack(-side => 
    "left");
$top1->Label(-text => "Right")->pack(-side => 
    "right");
$top1->Label(-text => "?Bottom?")->pack(-side => 
    "bottom");

# But when you use Frames, things work quite 
# alright.


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

sub do_fax
{
    my ($file, $font) = @_;
    my $file_val = $file->get;
    my $font_val = $font->get;

    print "Now faxing $file_val in font ".
    "$font_val\n";
}


sub do_print 
{
    my ($file, $font) = @_;
    my $file_val = $file->get;
    my $font_val = $font->get;

    print "Sending file $file_val" . 
    " to printer in font $font_val\n";
}


