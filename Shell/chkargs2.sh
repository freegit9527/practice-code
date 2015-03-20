#!/bin/bash - 
#===============================================================================
#
#          FILE: chkargs2.sh
# 
#         USAGE: ./chkargs2.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 04/15/2014 20:34
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ $# -eq 0 ]
then
	echo "Usage: chkargs2 argument..." 1>&2
	exit 1
else
	echo "Program running."
fi

exit 0

