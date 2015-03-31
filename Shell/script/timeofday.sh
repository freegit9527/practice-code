#!/bin/bash - 
#===============================================================================
#
#          FILE: timeofday.sh
# 
#         USAGE: ./timeofday.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/24/2014 12:28
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "Is it morning? Please answer yes or no"
read timeofday

if [ "$timeofday" = "yes" ]
then
	echo "Good morning"
elif [ "$timeofday" = "no" ]
then 
	echo "Good afternoon"
else
	echo "Sorry, $timeofday is not recongnised. Enter yes or no"
	exit 1
fi

exit 0

