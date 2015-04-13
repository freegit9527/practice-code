#!/bin/bash - 
#===============================================================================
#
#          FILE: casecondition-3.sh
# 
#         USAGE: ./casecondition-3.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/25/2014 08:08
#      REVISION:  version 1.3
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "Is it morning? Please enter yes or no"
read timeofday

case "$timeofday" in 
	[yY] | [yY][eE][sS] ) 
		echo "Good morning"
		echo "Up bright and early this morning"
		;;
	[nN] | [nN][oO] )
		echo "Good afternoon"
		;;
	*)
		echo "Sorry, answer not recognized"
		echo "Please answer yes or no"
		;;
esac

exit 0
