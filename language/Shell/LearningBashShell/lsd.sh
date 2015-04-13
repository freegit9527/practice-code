#!/bin/bash - 
#===============================================================================
#
#          FILE: lsd.sh
# 
#         USAGE: ./lsd.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: This program can not be running correctly.
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 08/02/2014 16:15
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

date=$1
list=$(ls -l | grep -i "^.\{31\}$date" | cut -c 44-)
echo $list

exit 0

