#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: ch_3.pl
#
#        USAGE: ./ch_3.pl  
#
#  DESCRIPTION: just for test some perl's grammer
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 08/16/2014 04:52:51 PM
#     REVISION: ---
#===============================================================================

#use strict;
use warnings;
use utf8;
use 5.010;

$fred[0] = "yabba";
$fred[1] = "dabba";
$fred[2] = "doo";
say $fred[0];
say $fred[1];
say $fred[2];
$fred[2] .= "diddley";
say $fred[2];
$fred[5] = "Fifth";
$i = 0;
while ($i <= 5)
{
	if (defined($fred[$i])) 
	{
		say "$i == > ", $fred[$i];
	}
	else {
		say "does not exist!";
	}
	$i += 1;
}
say "There are $#fred elements in fred array.";

@lst = (2..5);
say @lst;
@lst = 2..5;
say @lst;
@lst = qw(fred barney bety wilma dino);
#say @lst;

($fred, $barney, $dino) = qw / flintstone, rubble, undef /;
say "fred = ", $fred;
say "barney = ", $barney;
say "dino = ", $dino;
($fred, $barney) = ($barney, $fred);
say "fred = ", $fred;
say "barney = ", $barney;
if (defined($dino))
{
	say "dino is defined";
}
($fred, $dino) = ("FRED", undef);
if (defined($dino))
{
	say "dino is defined";
}
else 
{
	say "dino is not defined";
}
($rocks[0], $rocks[1], $rocks[2], $rocks[3]) = 
qw / talc
	mica
	feldspar
	quartz
	/;
@giant = 1..5;
@stuff = (@giant, undef, @giant);
$dino = "granite";
@tiny = ();
@quarry = (@rocks, "crushed rock", @tiny, $dino);

@copy = @quarry;

@array = 5..9;
say "@array";
$fred = pop @array;
say "@array";
push @array, 11;
say "@array";
push @array, @giant;
say "@array";
$m = shift @array;
say "m = ", $m;
$m = shift @array;
say "m = ", $m;
unshift @array, kk;
say "@array";
@removed = splice @array, 2, 0, $m;
say "removed = @removed";
say "array = @array";
$y = "2*4";
$y = "2";
$y -= 1;
say "y = $y";
$array="kiss";
print "this is ${array}[0]\n";
say "This is $array[0]";

say "rocks = @rocks";
$rock = "This is origin rock...";
foreach $rock (@rocks) {
	$rock = "\t$rock";
	$rock .= "\n";
}
say "the Rocks are:\n", @rocks;
say "Now, Rock is $rock";
$_ = "Yabba dabba doo\n";
print;
foreach (1..5)
{
	print "I can count to $_!\n";
}
print;
say "rocks == >\n@rocks";
@rocks = reverse @rocks;
say "rocks == >\n @rocks";

@rocks = qw /
	bedrock
	slate
	rubble
	granite
	/;
@sort_rocks = sort @rocks;
say "rocks = @rocks";
say "sort_rocks = @sort_rocks";
while (($index, $value) = each @rocks)
{
	say "$index: $value";
}
@people = qw / fred barney betty /;
@people_sorted = sort @people;
$number = 42 + @people;
say "people is: @people";
say "people_sorted is: @people_sorted";
say "number = $number";

$backwards = reverse qw / a b c d /;
say "backwards is: $backwards";

@fred = 6 * 7;
@barney = ( "hello" , ' ' , "world" );
say "fred = @fred";
say "barney = @barney";
say "This is the last line of the program.";

@rocks = qw / aa bb cc dd /;
say "rocks = @rocks";
say "How many rocks do you have?";
print "I have ", scalar @rocks, " rocks!\n";

chomp(@lines = <STDIN>);
#@lines = <STDIN>;
print "lines is:\n@lines";

