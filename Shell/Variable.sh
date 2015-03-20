#!/bin/bash - 
#===============================================================================
#
#          FILE: Variable.sh
# 
#         USAGE: ./Variable.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/24/2014 12:15
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

myvar="Hi there"

echo $myvar
echo "$myvar"
echo '$myvar'
echo \$myvar

echo Enter some text
read myvar

echo '$myvar' now equals $myvar

exit 0

