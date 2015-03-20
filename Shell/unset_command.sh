#!/bin/sh - 
#===============================================================================
#
#          FILE: unset_command.sh
# 
#         USAGE: ./unset_command.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/25/2014 12:19
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

foo="hello"
echo $foo
#unset foo 
foo=
echo $foo

