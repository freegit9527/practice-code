#!/bin/bash - 
#===============================================================================
#
#          FILE: yesorno.sh
# 
#         USAGE: ./yesorno.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 04/27/2014 16:14
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
read -p "Please enter Y or N: " judge
[ "Y" == "$judge" -o "y" == "$judge" ] && echo "OK, continue" && exit 0
[ "N" == "$judge" -o "n" == "$judge" ] && echo "NO, interrupt!" && exit 0
echo "I don't know what your choice is" && exit 0
