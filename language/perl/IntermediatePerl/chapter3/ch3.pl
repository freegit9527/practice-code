#!/usr/bin/env perl 
#===============================================================================
#         FILE: ch3.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/14/2015 11:31:23 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my @inputnumbers = (1..20);

print $_, " " for @inputnumbers;

say "";

my @odd_digit_nums = grep {
  my $sum;
  $sum += $_ for split //;
  $sum % 2;
} @inputnumbers;

say "odd_digit_nums are: @odd_digit_nums";
say "hello", ", world!";

my @alphas = qw(c b d e a g f);
say join ' ', @alphas;
say join ' ', sort @alphas;

say join ' ', reverse @alphas;

push @alphas, "liu";
say join ' ', @alphas;

my @nums = (1, 2, 4, 8, 16, 32, 64);
my @bigger_than_10 = grep $_ > 10, @nums;
say join ' ', @bigger_than_10;

my @end_with_4 = grep /4$/, @nums;
say join ' ', @end_with_4;

system("clear");

my @odd_digit_sum = grep digit_sum_is_odd($_), @nums;

say join ' ', grep digit_sum_is_odd($_), @nums;
say join ' ', @odd_digit_sum;

sub digit_sum_is_odd {
    my $sum = 0;
    $sum += $_ for split //, shift;
    $sum % 2;
}

say join ' ', map $_ + 100, @nums;
say join ' ', map {$_, $_ * 3, $_ * 5} @nums;
my %hash = map {$_, $_ * 3} @nums;
say $_, " -> ", $hash{$_} for sort {$a <=> $b} keys %hash;

say join ' ', map {
    #my $sum = 0;
    #$sum += $_ for split / /, $_;
    my @nums = split //;
    if ($nums[-1] == 4) {
        $_;
    }
    else {
        ();
    }
} @nums;

say join ' ', map {
    my $sum = 0;
    $sum += $_ for split //;
    if ($sum % 2 == 0) {
        $_;
    } else {
        ();
    }
} @nums;
my ($total, $count) = (100, 0);
eval {$total / $count};
say "error: $@" if $@;

for (qw(+ - * /)) {
    my $result = eval "2 $_ 0";
    say "Error: $@" if $@;
    say "$result" unless $@;
}

my $cond = 2;
my $bowler = do {
    if ($cond == 1) {100}
    elsif ($cond == 2) {102}
    else {103}
};
say "bowler = ", $bowler;

