#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: 2.pl
#
#  DESCRIPTION: B. Beautiful Paintings
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Lpaste (yesterday2young.github.io), liuxueyang457@163.com
# ORGANIZATION: Solution 1.
#      VERSION: 1.0
#      CREATED: 2016/03/17 21时31分48秒
#     REVISION: ---
#===============================================================================

#use strict;
#use warnings;
#use utf8;
#use List::MoreUtils qw(uniq);
#use 5.020;
$\ = $/;
while (<>) {
    $n = $_; $h->{$_}++ for split ' ', <>;
    print $n - (sort {$b <=> $a} values %{$h})[0];
}

exit 0;

