#!/bin/bash - 
#===============================================================================
#
#          FILE: testoutput.sh
# 
#         USAGE: ./testoutput.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 08/01/2014 08:03
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
echo "This is just to test ouput"
i=4
while [ $i -gt 0 ]
do
	echo "i = " $i
	i=$[$i-1]
done
exit 0

