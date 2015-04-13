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
#       CREATED: 04/02/2015 07:21
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if test $# -eq 0
then
    echo "You must supply at least one argument." 1>&2
    exit 1
fi

if test -f "$1"; then
    echo "$1 is an ordinary file."
else 
    echo "$1 is NOT an ordinary file."
fi

echo "Program running."
