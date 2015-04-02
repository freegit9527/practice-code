#!/bin/bash - 
#===============================================================================
#
#          FILE: out.sh
# 
#         USAGE: ./out.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 04/02/2015 07:38
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ $# -eq 0 ]; then
    echo "Usage: out [-v] filenames..." 1>&2
    exit 1
fi 

if [ "$1" = "-v" ]; then 
    shift 
    less -- "$@"
else 
    cat -- "$@"
fi 



