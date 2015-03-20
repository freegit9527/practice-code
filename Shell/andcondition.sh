#!/bin/bash - 
#===============================================================================
#
#          FILE: andcondition.sh
# 
#         USAGE: ./andcondition.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/25/2014 08:21
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

touch file_one
rm -f file_two

if [ -f file_one ] && echo "Hello" && [ -f file_two ] && echo "there"
then
	echo "in if"
else
	echo "in else"
fi

exit 0

