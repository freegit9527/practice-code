#!/bin/bash - 
#===============================================================================
#
#          FILE: countfiles.sh
# 
#         USAGE: ./countfiles.sh 
# 
#   DESCRIPTION: count executable files in path directory
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 08/01/2014 15:22
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

mypath=`echo $PATH | sed 's/:/ /g'`
for i in $mypath
do
	myfile=`ls $i`
	count=0
	for j in $myfile
	do
		j=$i$j
		if [ -x $j ]
		then 
			count=$[ $count + 1 ]
# 			echo "$j is executable."
		fi
	done
	echo "$i - $count"
	echo "******************************"
done

exit 0

