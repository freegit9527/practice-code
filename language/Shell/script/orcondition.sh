#!/bin/bash - 
#===============================================================================
#
#          FILE: orcondition.sh
# 
#         USAGE: ./orcondition.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 2014/03/25 08:33
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

rm -f file_one
if [ -f file_one ] || echo "hello" || echo "there"
then
	echo "in if"
else
	echo "in else"
fi

exit 0

