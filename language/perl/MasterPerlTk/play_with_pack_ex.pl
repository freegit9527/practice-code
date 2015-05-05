#!/usr/bin/env perl 
#===============================================================================
#         FILE: play_with_pack_ex.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/05/2015 04:06:27 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use Tk;
require Tk::BrowseEntry;
use 5.014;

my $numWidgets;

if ($#ARGV >= 0) { $numWidgets = $ARGV[0]; }
else { $numWidgets = 4; }

my $mw = MainWindow->new(-title => "Play w/pack");
my $f = $mw->Frame(-borderwidth => 2, -relief => 'groove')
	->pack(-side => 'top', -fill => 'x');
my (@packdirs) = ( );

my $i = 0;
foreach (0..$numWidgets)
{
	$packdirs[$_] = 'top';
	my $be = $f->BrowseEntry(-label => "Widget $_:", 
		-choices => ["right", "left", "top", "bottom"], 
		-variable => \$packdirs[$_], -browsecmd => \&repack)
		->pack(-ipady => 5);
}

$f->Button(-text => "Repack", -command => \&repack )
	->pack(-anchor => 'center');

# use a separate window so we can see what the output 
# looks like without clutter.
my $top = $mw->Toplevel(-title => "output window");
my $c;
foreach (@packdirs)
{
	my $b = $top->Button(-text => $c++ . ": $_", 
		-font => "Courier 20 bold")
		->pack(-side => $_, -fill => 'both', -expand => 1);
}

MainLoop;

sub repack
{
	my @w = $top->packSlaves;
	foreach (@w) { $_->packForget; }
	my $e = 0;
	foreach (@w)
	{
		$_->configure(-text => "$e: $packdirs[$e]");
		$_->pack(-side => $packdirs[$e++], -fill => 'both', -expand => 1)	;
	}
}


