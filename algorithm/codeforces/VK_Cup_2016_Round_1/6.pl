#!/usr/bin/env perl 
#===============================================================================
#         FILE: 6.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 02:23:29 PM
#===============================================================================

#use strict;
#use warnings;
#use utf8;
#use 5.020;

#my $sum = <>;
#my @array = split ' ', <>;
#@array = map {$array[$_]} 0..$sum-1;
#my $max = {id => $array[0], count => 1};
#my %likes;
#for (0..$sum-1) {
#    my $id = $array[$_];
#    my $count = ++$likes{$id};
#    $max = {id => $id, count => $count} 
#      if ($count > $max->{count});
#}
#print $max->{id}, "\n";

my $sum = <>;
my @like_hist = split " ", <>;
@like_hist = map { $like_hist[$_] } 0..$sum-1;

my $counts = {};
my $max = {id => $like_hist[0], count => 1 };

my $k = 0;
for (0..$sum-1) {
	my $id = $like_hist[$_];
	my $count = ++$counts->{$id};
	$max = {id => $id, count => $count } if ($count > $max->{count});
}

print $max->{id};
