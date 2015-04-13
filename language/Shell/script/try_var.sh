#!/bin/bash - 
#===============================================================================
#
#          FILE: try_var.sh
# 
#         USAGE: ./try_var.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/24/2014 12:16
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
salutation="Hello"
echo $salutation
echo "The program $0 is now running"
echo "The second parameter was $2"
echo "The first parameter was $1"
echo "The parameter list was $*"
echo "The user's home directory is $HOME"

echo "Please enter a new greeting"
read salutation
echo "The script is now complete"

exit 0

