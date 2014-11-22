#!/usr/bin/env perl 
#===============================================================================
#         FILE: ch3.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 11/09/2014 16:18:09
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my @input_numbers = (1, 2, 4, 8, 16, 32, 64);
my @bigger_than_10 = grep $_ > 10, @input_numbers;
my @end_in_4 = grep /4$/, @input_numbers;
my @odd_digit_sum = grep &digit_sum_is_odd($_), @input_numbers;
say "@bigger_than_10\n@end_in_4\n@odd_digit_sum";
sub digit_sum_is_odd {
	my $input = shift;
	my @digits = split //, $input;
	my $sum =0; $sum += $_ for @digits;
	return $sum % 2;
};

my @end_with_4 = map {
	my @num = split //, $_;
	if ($num[-1] == 4) {
		($_);
	} else {
		();
	}
} @input_numbers;
say "end_with_4 after map is: @end_with_4";

