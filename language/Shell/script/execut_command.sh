#!/bin/bash - 
#===============================================================================
#
#          FILE: execut_command.sh
# 
#         USAGE: ./execut_command.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/25/14 14:21
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo The current directory is $PWD
echo The current users are $(who)
whoisthere=$(who)
echo $whoisthere

exit 0
