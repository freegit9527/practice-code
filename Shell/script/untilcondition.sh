#!/bin/bash - 
#===============================================================================
#
#          FILE: untilcondition.sh
# 
#         USAGE: ./untilcondition.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/24/2014 14:03
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

until who | grep "lxy" > /dev/null 
do
	sleep 60
done

echo -e '\a'
echo "**** lxy has just logged in ****"

exit 0
