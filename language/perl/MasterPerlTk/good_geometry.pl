#!/usr/bin/env perl 
#===============================================================================
#         FILE: good_geometry.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/05/2015 11:26:32 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;

my $mw = MainWindow->new;

$mw->title("Good window");

$mw->Label(
    -text => "This window looks better."
)->pack;

my $exit = $mw->Button(
    -text => "Exit",
    -command => sub 
    {
        exit
    }
)->pack(
    -side => 'bottom',
    -expand => 1,
    -fill => 'x'
);

$mw->Checkbutton(
    -text => "I like it!"
)->pack(
    -side => 'left',
    -expand => 1
);

$mw->Checkbutton(
    -text => "I hate it!"
)->pack(
    -side => 'left',
    -expand => 1
);

$mw->Checkbutton(
    -text => "I do not care!"
)->pack(
    -side => 'left',
    -expand => 1
);

my $enlarge = $mw->Button(
    -text => "Enlarge",
    -command => \&repack_kids,
)->pack(
    -side => 'bottom',
    -anchor => 'center',
    -before => $exit,
    -fill => 'x',
    -expand => 1,
);

$mw->Button(
    -text => "Decrease",
    -command => \&decre_kids,
)->pack(
    -side => 'bottom',
    -anchor => 'center',
    -after => $enlarge,
    -fill => 'x',
    -expand => 1,
);

sub repack_kids
{
    my @kids = $mw->packSlaves;

    for (@kids)
    {
        my %packinfo = $_->packInfo();
        $_->pack(
            -ipadx => 10 + $packinfo{"-ipadx"},
            -ipady => 10 + $packinfo{"-ipady"},
        );
    }
}

sub decre_kids
{
    my @kids = $mw->packSlaves;

    for (@kids)
    {
        my %packinfo = $_->packInfo();
        $_->pack(
            -ipadx => $packinfo{"-ipadx"} - 10,
            -ipady => $packinfo{"-ipady"} - 10,
        );
    }
}

MainLoop;
