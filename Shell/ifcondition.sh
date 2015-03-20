#!/bin/bash - 
#===============================================================================
#
#          FILE: ifcondition.sh
# 
#         USAGE: ./ifcondition.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/24/2014 12:26
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ -f /bin/bash ]
then
	echo "file /bin/bash exists"
fi

if [ -d /bin/bash ]
then 
	echo "/bin/bash is a directory"
else
	echo "/bin/bash is NOT a directory"
fi

exit 0

