#!/usr/bin/env perl 
#===============================================================================
#         FILE: generate_input_file.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 09:54:18 AM
#      根据Perl文件创建输入文件
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my @perl_files = <[1-5].pl>;
say join ' ', @perl_files;

for (@perl_files) {
    my $input_file = (split '', $_)[0];
    next if -f $input_file;
    my $fh;
    open $fh, '>', $input_file;
    close $fh;
}
