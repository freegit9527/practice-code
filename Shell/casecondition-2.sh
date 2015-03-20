#!/bin/bash - 
#===============================================================================
#
#          FILE: casecondition-2.sh
# 
#         USAGE: ./casecondition-2.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/25/2014 08:03
#      REVISION:  version 1.2
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "Is is morning? Please answer yes or no"
read timeofday

case "$timeofday" in 
	yes | [Yy] | Yes | YES ) 
		echo "Good morning"
		echo "Up bright and early this morning"
		;;
	[nN]* ) 
		echo "Good afternoon"
		;;
	* )
		echo "Sorry, answer not recognized"
		echo "Please answer yes or no"
		exit 1
		;;
esac

exit 0
