#!/bin/bash - 
#===============================================================================
#
#          FILE: function_pass_parameter.sh
# 
#         USAGE: ./function_pass_parameter.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 2014/03/25 09:38
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

yes_or_no ()
{
	echo "Is your name $* ?"
	while true
	do
		echo -n "Enter yes or no: "
		read x
		case "$x" in 
			[Yy] | [yY][eE][sS] ) 
				return 0
				;;
			[nN] | [nN][oO] )
				return 1
				;;
			* )
				echo "Answer yes or no"
				;;
		esac
	done
}

echo "Origin parameters are $*"
if yes_or_no "$1"
then
	echo "Hi $1, nice name"
else
	echo "Never mind"
fi

exit 0
