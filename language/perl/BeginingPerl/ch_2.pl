#!/usr/bin/perl
#===============================================================================
#
#         FILE: ch_2.pl
#
#        USAGE: ./ch_2.pl  
#
#  DESCRIPTION: no
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 08/15/2014 10:27:44 PM
#     REVISION: ---
#===============================================================================

#use strict;
use warnings;
use utf8;
use 5.010;

say "Hello world!";
say "This is a program for Chapter Two";
$count = 0;
while ($count < 10) {
	$count += 2;
	print "count is now $count\n";
}
$n1 = 1.25;
$n1_1 = 1.;
$n2 = -1.2e-23;
say "n1 = $n1";
say "n2 = $n2";
say "n1_1 = $n1_1";
$n3 = 61_298_040_283_768;
$n4 = 0xff;
$n5 = 0377;
$n6 = 0b11111111;
say "n3 = $n3";
say "n4 = $n4";
say "n5 = $n5";
say "n6 = $n6";

print "Hello and " . "world\n";
print "fred " x 3 . "\n";
print 5 x 4.8 . "\n";

print "The answer is ", 6 * 7, ".\n";

$meal = "bronto saurus steak";
$barney = "fred ate a $meal";
print $barney . "\n";

print 'The barney is $barney' . "\n";

$que = ord('?');
print "que is $que\n";
$Que = chr($que);
print "que is $Que\n";

$name = "wred";
if ($name gt 'fred')
{
	print "'$name' comes afger 'fred' in sorted order.\n";
}

if (! '0')
{
	print "'0' is false!\n";
}

$still_true = !! 'Fred';
$still_false = !! '0';

print "still_true is $still_true\n";
print "still_false is $still_false\n";

$mul_line = "This is multiple
line\n";
print "multiple line is the Following:$mul_line";

#$line = <STDIN>;
$line = "Hi\n";
if ($line eq "\n")
{
	print "Thas was just a blank line.\n";
}
else
{
	print "That line of input was: $line";
}

#$text = <STDIN>;
#chomp($text = <STDIN>);
#print "text = $text\n";

$n = 1;
$sum = undef;
while ($n < 10)
{
	$sum += $n;
	$n += 2;
}
print "The total was $sum.\n";

$un_define = undef;
print "un_define is <$un_define>\n";

$madonna = <STDIN>;
if (defined($madonna)) 
{
	print "The input was $madonna";
}
else
{
	print "No input available!\n";
}

print "This is the last line.\n";
