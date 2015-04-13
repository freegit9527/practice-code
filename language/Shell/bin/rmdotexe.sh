#!/bin/bash - 
#===============================================================================
#
#          FILE: rmdotexe.sh
# 
#         USAGE: ./rmdotexe.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 04/27/14 19:31
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

filename=$(ls | grep -v "\.c")
for i in $filename 
do
	if [ -d $i ]; then
		rm -rf $i
	elif [ -f $i ]; then
		rm -f $i
	fi
done
 
exit 0

