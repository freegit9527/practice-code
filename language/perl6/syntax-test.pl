#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: syntax-test.pl
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Lpaste (liuxueyang.github.io), liuxueyang457@163.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2016年04月17日 09时24分35秒
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
#use 5.020;
$\ = $/;
#use Data::Dumper::Simple;

#my $abc = '123';
#my ($var_name) = split /=/, Dumper($abc);
#say $var_name;

my $czhiang = '1985';

sub hello {
    my $user = $_[0];
    my $command = '$'.$user;
    my $age = eval($command);
    print "$user $age\n";
}

&hello('czhiang');

exit 0;


