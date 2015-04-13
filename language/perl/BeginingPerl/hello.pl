#!/usr/bin/env perl 
#===============================================================================
#         FILE: hello.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 01/14/2015 11:50:24 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

print "Hello, world!\n";
print qq=Did you say "Hello?"\n=;

print 'Greetings, small planet!\n';
print q/What's cokking?\n/;

my $fred = "Fred here";
my $barney = 56;
my $sum = 10 + $barney;
print 'The variable $fred' . " contains $fred.\n";
print "Sum is $sum.\n";

my @fred = ("How", "are", "you", "today?");
print "\@fred contains (@fred).\n";

my $mike = $fred[1];
print "$mike $fred[3]\n";

my $fredsize = @fred;
print '@fred has ', "$fredsize elements.\n";

print "Max sub is $#fred\n";

my %fred;
$fred{"with"} = "without";
$fred{"this"} = "that";
$fred{"moutain"} = "valley";
$fred{"left"} = "right";
print qq/$fred{"this"}\n/;

my @keys = keys(%fred);
print "Keys are (@keys)\n";

my %yard = (
	red => 'brik',
	blue => 'sky', 
	green => 'grass',
	yellow => 'dandelion',
);
$yard{'blue'} = 'skyyy';
print "$yard{'blue'} $yard{'yellow'}\n";

my @alex = (fred => 44,
	joe => 2983,
	mike => -94);
my %heather = ('this','will',
	'actually', 'work');

print "A: \@alex = (@alex)\n";
print "B: $heather{'this'} $heather{'actually'}\n";

%heather = @alex;
print "C: [$heather{'fred'}] [$heather{'joe'}] [$heather{'mike'}] \n";
$heather{'dingbat'} = 8822;
$heather{'giggles'} = 33;
@alex = %heather;
print "D: (@alex)\n";

%heather = (brillig => 74,
	snark => 34,
	slithy => 18,
	snark => 99,
	beamish => 48,
	brillig => 1);
print "E: [$heather{'brillig'}] [$heather{'snark'}] ",
"[$heather{'slithy'}] [$heather{'beamish'}]\n";

my $a = 5;
while ($a > 0) {
	print "$a ";
	$a--;
}
print "\n";

#while (my $fred = <STDIN>) {
#	print $fred;
#}

#while (my $fred = <>) {
#	print $fred;
#}

#while (<STDIN>) {
#	print $_;
#}

#while (<>) {
#	print;
#}

#print "How many lines? ";
#my $num = <STDIN>;
#$num > 0 or die "Num must be positive. You entered $num.";
#
#my $accum = "";
#my $sep = "";
#while (my $line = <STDIN>) {
#	chomp $line;
#	if ($line eq "STOP!") {
#		last;
#	}
#	$accum = "$accum$sep$line";
#	if (--$num == 0) {
#		last;
#	}
#	$sep = " ";
#}
#
#print "$accum\n";

#my $wasquit = 0;
#print "ctl2> ";
#while (my $line = <STDIN>) {
#	chomp $line;
#	print "Jones\n" if $line eq 'smith';
#
#	if ($line eq 'stop') {
#		print "That's better.\n" if $wasquit;
#		last;
#	}
#	if ( $line eq 'quit' ) {
#		$wasquit = 1;
#		print "You must say stop if you want to quit.\n";
#	}
#	else {
#		$wasquit = 0;
#	}
#
#	print "$line to you!\n" if $line;
#
#	print "ctl2> " unless $line eq 'sssh';
#}
#

my $sub = 0;
while ( $sub <= $#ARGV ) {
	print "$ARGV[$sub]\n";
	++$sub;
}
print "[@ARGV]\n";

print "There is another way to print all the command line",
" arguments\n";
for (my $sub = 0; $sub <= $#ARGV; ++$sub) {
	print "$ARGV[$sub]\n";
}
print "[@ARGV]\n";

print "Here is yet another way to print those...\n";
for my $arg (@ARGV) {
	print "$arg\n";
}
print "[@ARGV]\n";

#print "Yet, here is another way....==\n";
#while ( my $item = shift @ARGV ) {
#	print "$item\n";
#}
#print "[@ARGV]\n";

print "Let us construct new argument list...\n";
my @newargs;
while ( my $item = shift @ARGV ) {
	print "$item\n";
	push @newargs, $item;
}
print "[@newargs]\n";

my @keys = keys(%ENV);
while ( my $key = shift @keys ) {
	print "$key = $ENV{$key}\n";
}

for my $key (sort keys(%ENV)) {
	print "$key = $ENV{$key}\n";
}
