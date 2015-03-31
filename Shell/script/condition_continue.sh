#!/bin/bash - 
#===============================================================================
#
#          FILE: condition_continue.sh
# 
#         USAGE: ./condition_continue.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 2014/03/25 09:58
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

rm -rf fred*
echo > fred1
echo > fred2
mkdir fred3
echo > fred4

for file in fred*
do
	if [ -d "$file" ]; then
		echo "skipping directory $file"
		continue
	fi
	echo file is $file
done

for x in 1 2 3
do
	echo before $x
	continue
	echo after $x
done

exit 0
