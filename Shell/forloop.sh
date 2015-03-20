#!/bin/bash - 
#===============================================================================
#
#          FILE: forloop.sh
# 
#         USAGE: ./forloop.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/24/2014 13:54
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

for foo in bar fud 43
do
	echo $foo
done

exit 0

