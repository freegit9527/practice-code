#!/usr/bin/env perl 
#===============================================================================
#         FILE: 1.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 05:01:19 PM
#===============================================================================

#use strict;
#use warnings;
#use utf8;
#use Data::Dumper;

while (<>) {
  my ($n, $a, $b) = split;
  if ($a * $b < $n) {
      print "-1\n";
  } else {
      my $array;
      my $cnt = 1;
      for my $i (0..$a-1) {
          for my $j (0..$b-1) {
              if ($cnt > $n) {
                  $array->[$i][$j] = 0;
              } else {
                  $array->[$i][$j] = $cnt++;
              }
          }
      }
      if ($b % 2) {
          # odd
          for (0..$a-1) {
              print join ' ', @{$array->[$_]};
              print "\n";
          }
      } else {
          # even
          for (0..$a-1) {
              if ($_ % 2) {
                  print join ' ', reverse @{$array->[$_]};
                  print "\n";
              } else {
                  print join ' ', @{$array->[$_]};
                  print "\n";
              }
          }
      }
  }
}

exit 0;
