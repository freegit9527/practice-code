#!/bin/bash - 
#===============================================================================
#
#          FILE: lnks.sh
# 
#         USAGE: ./lnks.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 04/02/2015 07:47
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ $# -eq 0 -o $# -gt 2 ]; then 
    echo "Usage: lnks file [directory]" 1>&2
    exit 1
fi 

if [ -d "$1" ]; then 
    echo "First argument cannot be a directory." 1&2
    echo "Usage: lnks file [directory]" 1&2
    exit 1
else 
    file="$1"
fi

