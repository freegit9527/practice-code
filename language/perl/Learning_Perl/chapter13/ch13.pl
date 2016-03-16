#!/usr/bin/env perl 
#===============================================================================
#         FILE: ch13.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 2016/03/14 18时35分35秒
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use File::Spec::Functions;

my $dir = '.';
chdir "$dir" or die "cannot not chdir to $dir: $!";

my @all_files = glob '*.pl'; # glob 并不会递归查找文件
print join "\n", @all_files, "\n";

$dir = '/etc';
my @dir_files = <$dir/* $dir/.*>;
#say join ' ', @dir_files;

my $dir_to_process = '/home/aries/Hack';
opendir my $dh, $dir_to_process or
  die "Cannot open $dir_to_process: $!";

for (readdir $dh) {
    next if /^\./;
    my $full_path = catfile($dir_to_process, $_);
    say "one file in $dir_to_process is: $full_path";
}

closedir $dh;

