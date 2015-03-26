#!/bin/bash - 
#===============================================================================
#
#          FILE: script1.sh
# 
#         USAGE: ./script1.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/26/2015 21:42
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
clear
echo "The script starts now."

echo "Hi, $USER!"
echo

echo "I will now fetch you a list of connected users."
echo

set  -x

w

set +x

echo

echo "END HERE..."
