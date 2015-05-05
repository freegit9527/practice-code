#!/usr/bin/env perl 
#===============================================================================
#         FILE: anchor.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/05/2015 03:23:59 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;

my $mw = MainWindow->new;
$mw->geometry("300x300");
$mw->Button(
    -text => "Yes",
)->pack(
    -side => 'left',
    -anchor => 'n',
);

$mw->Button(
    -text => "No",
    -command => sub 
    {
        exit;
    }
)->pack(
    -side => 'left',
    -anchor => 'n',
);

MainLoop;
