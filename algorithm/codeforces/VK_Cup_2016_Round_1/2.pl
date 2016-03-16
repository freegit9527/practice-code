#!/usr/bin/env perl 
#===============================================================================
#         FILE: 2.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 02:36:23 PM
#===============================================================================

#use strict;
#use warnings;
#use utf8;

while (<>) {
    my $num = $_;
    my @names;
    my $name;
    for (1..$num) {
        chomp($name = <>);
        push @names, $name;
    }
    my $hash;
    for (reverse @names) {
        print $_, "\n" unless $hash->{$_};
        $hash->{$_} = 1;
    }
}
exit 0;
