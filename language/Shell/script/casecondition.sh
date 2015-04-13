#!/bin/bash - 
#===============================================================================
#
#          FILE: casecondition.sh
# 
#         USAGE: ./casecondition.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/25/2014 07:51
#      REVISION:  version 1.0
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "Is it morning? Please answer yes or no"
read timeofday

case "$timeofday" in 
	yes) echo "Good morning";;
	y)   echo "Good morning";;
	no)  echo "Good afternoon";;
	n)   echo "Good afternoon";;
	*)   echo "Sorry, answer is not recognized";;
esac

exit 0
