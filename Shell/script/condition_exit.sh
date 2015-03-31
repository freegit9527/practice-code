#!/bin/bash - 
#===============================================================================
#
#          FILE: condition_exit.sh
# 
#         USAGE: ./condition_exit.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 2014/03/25 10:28
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#[ -f diff1 ] && exit 0 || exit 1

if [ -f diff1 ]; then
	echo exist
	exit 0
fi

exit 1
