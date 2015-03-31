#!/bin/bash - 
#===============================================================================
#
#          FILE: :condition.sh
# 
#         USAGE: ./:condition.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 2014/03/25 09:55
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

rm -f fred
if [ -f fred ]; then
	:
else
	echo file fred did not exist
fi

exit 0

