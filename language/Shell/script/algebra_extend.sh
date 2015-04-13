#!/bin/bash - 
#===============================================================================
#
#          FILE: algebra_extend.sh
# 
#         USAGE: ./algebra_extend.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/25/14 14:24
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
x=0
while [ "$x" -ne 10 ]; do 
	echo $x
	x=$((x+1))
done

exit 0

