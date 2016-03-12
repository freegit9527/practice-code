#!/usr/bin/env perl 
#===============================================================================
#         FILE: bfs.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 2016/03/12 09时42分37秒
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my ($rec_row, $rec_column) = (1000+1, 1000+1);
my $point_count = 0;
my ($edges_count, $i, $j);
my (@rec, @bfs_queue, @already_visit);

sub bfs {
    my ($head, $tail, $i, $start);
    $head = $tail = 1;
    $start = shift;
    $bfs_queue[$head] = $start;
    $already_visit[$start] = 1;
    ++$tail;

    while ($head < $tail) {
        print $bfs_queue[$head], ' ';
        for (1..$point_count) {
            if ($rec[$_][$bfs_queue[$head]] == 1 &&
                $already_visit[$_] == 0) {
                $bfs_queue[$tail] = $_;
                $already_visit[$_] = 1;
                ++$tail;
            }
        }
        ++$head;
    }
}


($point_count, $edges_count) = split / /, <>;

for $i (1..$rec_row) {
    $rec[$i][$_] = 0 for (1..$rec_column);
}

$bfs_queue[$_] = 0 for (1..(1000_000+1));
$already_visit[$_] = 0 for (1..(1000_000+1));

for (1..$edges_count) {
    my ($row, $column) = split / /, <>;
    $rec[$row][$column] = 1;
    $rec[$column][$row] = 1;
}

bfs(1);

