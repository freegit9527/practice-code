#!/usr/bin/env perl 
#===============================================================================
#         FILE : exercise_2.pl (Intermediate_Perl/chapter3)
#       AUTHOR : Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION : Hunan University
#      CREATED : 2016/03/14 17时02分39秒
# DISCRIPTION  : 给定一个目录，输入合法的正则表达式，在这个目录下面找到文件名和正则表达式匹配的文件，并且列出来。如果输入C-d或者直接输入回车程序结束。
#      VERSION : 两个需要改进的地方：1.目录在参数中给出。2.文件的绝对路径不应该匹配，应该取绝对路径的basename。
#
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use File::Find;

while (<>) {
    chomp;
    my $pattern = $_;
    last if $pattern eq "";
    eval {
        find( sub { say "$File::Find::name" if (-f and 
                      $File::Find::name =~ /$pattern/);},
            '/home/aries/Hack/algorithm/codeforces/',);
    };
    print "pattern error: $@" if $@;
}

