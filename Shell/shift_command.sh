#!/bin/bash - 
#===============================================================================
#
#          FILE: shift_command.sh
# 
#         USAGE: ./shift_command.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/25/14 10:54
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
while [ "$1" != "" ]; do 
	echo "$1"
	shift
done

