#!/bin/bash - 
#===============================================================================
#
#          FILE: casecondition-1.sh
# 
#         USAGE: ./casecondition-1.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/25/2014 07:55
#      REVISION:  version 1.1
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "Is it morning? Please answer yes or no"
read timeofday

case "$timeofday" in 
	yes | y | Yes | YES) echo "Good morning";;
	no | n | No | NO)    echo "Good afternoon";;
	* )                  echo "Sorry, anser not recognized";;
esac

exit 0
