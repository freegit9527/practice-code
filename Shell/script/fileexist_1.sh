#!/bin/bash - 
#===============================================================================
#
#          FILE: fileexist_1.sh
# 
#         USAGE: ./fileexist_1.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 04/27/2014 15:47
#      REVISION: 0.2
#===============================================================================

set -o nounset                              # Treat unset variables as an error
echo -e "Please input a filename, I will check the filename's type and \
permission. \n\n"

read -p "Input a filename: " filename
test -z $filename && echo "YOU MUST ENTER A FILENAME" && exit 0

test ! -e $filename && echo "The $filename does not exist" && exit 0

test -f $filename && filetype="regular"
test -d $filename && filetype="directory"

test -r $filename && perm="readable"
test -w $filename && perm="$perm writable"
test -x $filename && perm="$perm executable"

echo "The filename: $filename is a $filetype"
echo "And the permission are: $perm"

exit 0
