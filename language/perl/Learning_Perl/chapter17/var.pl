#!/usr/bin/env perl 
#===============================================================================
#         FILE: var.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/24/2015 20:23:01
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;


print "<", $", ">";
print "<", $/, ">";
$\ = $/; # $/ is input , $\ is output
print "hello...";
print "hello...";
