#!/bin/bash - 
#===============================================================================
#
#          FILE: is_ordfile.sh
# 
#         USAGE: ./is_ordfile.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 04/15/2014 20:28
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if test $# -eq 0
then
	echo "you must supply at least one argument."
	exit 1
fi

if test -f "$1"
then
	echo "$1 is a ordinary file."
else
	echo "$1 is NOT a ordinary file."
fi

