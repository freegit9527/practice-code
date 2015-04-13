#!/bin/bash - 
#===============================================================================
#
#          FILE: test13in16.sh
# 
#         USAGE: ./test13in16.sh 
# 
#   DESCRIPTION: using recursion
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 07/31/2014 16:25
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function factorial
{
	if [ $1 -eq 1 ]
	then 
		echo 1
	else 
		local temp=$[ $1-1 ]
		local result=`factorial $temp`
		echo $[$result*$1]
	fi
}
read -p "Enter value: " value 
result=`factorial $value`
echo "The factorial of $value is: $result"

exit 0

