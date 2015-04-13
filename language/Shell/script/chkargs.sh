#!/bin/bash - 
#===============================================================================
#
#          FILE: chkargs.sh
# 
#         USAGE: ./chkargs.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 04/15/2014 20:25
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if test $# -eq 0
then
	echo "You must supply at least one argument."
	exit 1
fi

echo "Program running."

exit 0

