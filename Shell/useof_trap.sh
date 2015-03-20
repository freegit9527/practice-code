#!/bin/bash - 
#===============================================================================
#
#          FILE: useof_trap.sh
# 
#         USAGE: ./useof_trap.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/25/14 11:05
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

trap 'rm -f ./my_tmp_file_$$' INT 

echo creating file ./my_tmp_file_$$
date > ./my_tmp_file_$$

echo "pressing interrupt (CTRL-C) to interrupt ...."

while [ -f ./my_tmp_file_$$ ]; do 
	echo file exists
	sleep 1
done

echo The file no longer exists

trap INT
echo creating file ./my_tmp_file_$$
date > ./my_tmp_file_$$

echo "pressing interrupt (CTRL-C) to interrupt ...."

while [ -f ./my_tmp_file_$$ ]; do
	echo file exists
	sleep 3
done

echo we never get here
exit 0

