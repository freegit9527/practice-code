#!/usr/bin/env perl 
#===============================================================================
#         FILE: re.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/26/2015 08:44:46 PM
#===============================================================================


$_ = "a b c d";
$num = () = /(\S+)/g;
print $num;

$str = "a b c d e c";
$nu = () = $str =~ /c/g;
print $nu;
