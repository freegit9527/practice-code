#!/bin/bash - 
#===============================================================================
#
#          FILE: highest.sh
# 
#         USAGE: bash ./highest.sh filename [howmany]
# 
#   DESCRIPTION: print the highest 'howmany' lines in filename file.
# 
#       OPTIONS: howmany
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: howmany is set to 10 by default
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 08/02/2014 13:37
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

filename=${1:?"filename missing."}
howmany=$2

sort -nr $filename | head -${howmany:=10}

exit 0

