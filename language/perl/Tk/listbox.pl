#!/usr/bin/env perl 
#===============================================================================
#         FILE: listbox.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/05/2015 07:59:00 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;

my $mw = MainWindow->new;

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

MainLoop;

