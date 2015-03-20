#!/bin/bash - 
#===============================================================================
#
#          FILE: backup.sh
# 
#         USAGE: ./backup.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 04/27/2014 06:16
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo -e "I will use 'touch' command to create 3 files"

read -p "Please input your filename: " fileuser

filename=${fileuser:-"filename"}

date1=$(date --date="1 day ago" +%Y%m%d)
date2=$(date --date="2 days ago" +%Y%m%d)
date3=$(date +%Y%m%d)

file1=${filename}${date1}
file2=${filename}${date2}
file3=${filename}${date3}

touch $file1
touch $file2
touch $file3
