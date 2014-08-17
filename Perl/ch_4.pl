#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: ch_4.pl
#
#        USAGE: ./ch_4.pl  
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
#      CREATED: 08/16/2014 11:09:22 PM
#     REVISION: ---
#===============================================================================

#use strict;
use warnings;
use utf8;
use 5.010;

sub marine
{
	$n += 1;
	print "Hello, sailor number $n\n";
}

&marine();
&marine();
&marine();
&marine();

$fred = 3;
$barney = 4;
$wilma = &sum_of_fred_and_barney;
print "\$wilma is $wilma.\n";

$betty = &sum_of_fred_and_barney * 3;
print "\$wilma is $betty.\n";

sub sum_of_fred_and_barney
{
	print "Hey, you called the sum_of_fred_and_barney subroutine!\n";
	$fred + $barney;
}

sub max
{
#	my ($m, $n);
#	($m, $n) = @_;
#	my ($m, $n) = @_;
#	if ($m > $n) {
#		$m;
#	}
#	else {
#		$n;
#	}
	my ($max_so_far) = shift @_;
	foreach (@_)
	{
		if ($_ > $max_so_far) {
			$max_so_far = $_;
		}
	}
	$max_so_far;
#	if ($_[0] > $_[1]) {
#		$_[0];
#	} else {
#		$_[1];
#	}
}
$n = &max(10, 15, 3, 5, 100, 101);
print "n = $n\n";

foreach (1..5)
{
	my ($square) = $_ * $_;
	print "$_ squared is $square.\n";
}

my @names = qw / fred barney betty dino wilma pebbles
		bamm-bamm/;
my $result = &which_element_is("dino", @names);
sub which_element_is
{
	my ($what, @array) = @_;
	foreach (0..$#array) {
		if ($what eq $array[$_]) {
			return $_;
		}
	}
	-1;
}
print "index is: $result.\n";

sub chomp 
{
	print "Muuch, muuch!\n";
}

&chomp;

sub gene_list
{
	my ($a, $b) = @_;
	if ($a < $b) {
		$a..$b;
	} else {
		reverse $b..$a;
	}
}

my @re = &gene_list(10, 6);
say "@re";
my @se = &gene_list(6, 10);
say "@se";

sub marine 
{
	state $n = 0;
	$n += 1;
	say "Hello, sailor number $n!";
}

&marine;
&marine;
&marine;

sub running_sum 
{
	state $sum = 0;
	state @numbers ;
	foreach my $number (@_)
	{
		push @numbers, $number;
		$sum += $number;
	}
	say "The sum of (@numbers) is $sum";
}

running_sum(5, 6);
running_sum(1..3);
running_sum(4);
