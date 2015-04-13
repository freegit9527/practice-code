#!/usr/bin/env perl 
#===============================================================================
#         FILE: subroutines.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 01/14/2015 04:09:31 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Data::Dumper qw(Dumper);

sub mysubroutine {
	print "Not a very interesting routine.\n";
	print "This does the same thing every time.\n";
	return ;
} ## --- end sub mysubroutine

&mysubroutine;

sub printargs {
	print "Your first argument was $_[0]\n";
	print "and $_[1] was your second.\n";
}

&printargs("perly", "king");
print "=" x 10 . "\n";
&printargs("frog", "and", "toad");


sub maximum {
	my	( $part1, $part2 )	= @_;
	return $part1 if $part1 > $part2;
	$part2;
} ## --- end sub maximum

my $biggest = &maximum(37, 24);
print "\$biggest is $biggest\n";

sub inside {
	local ($a, $b) = @_;
	$a =~ s/ //g;
	$b =~ s/ //g;
	($a =~ /$b/ || $b =~ /$a/);
}
if (&inside("lemon", "dol money"))
{
	print "inside\n";
}
else {
	print "not inside..\n";
}

my $info = "Caine:Michael:Actor:14, Leafy Drive";
my @personal = split(/:/, $info);
print "\@personal = (@personal)\n";
for my $item (@personal) {
	print "$item/-/";
}
#while ( <> ) {
#	my ($a, $b) = split(/ /);
#	print "\$a = $a, \$b = $b\n";
#}

say "";
my $word = "liu";
my @chars = split(//, $word);
print "@chars\n";
