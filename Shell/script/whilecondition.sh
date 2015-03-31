#!/bin/bash - 
#===============================================================================
#
#          FILE: whilecondition.sh
# 
#         USAGE: ./whilecondition.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/24/2014 13:57
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "Enter passwd"
read trythis

while [ "$trythis" != "secret" ]; do 
	echo "Sorry, try again"
	read trythis
done

exit 0

