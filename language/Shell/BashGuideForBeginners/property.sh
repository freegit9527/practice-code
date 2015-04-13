#!/bin/bash - 
#===============================================================================
#
#          FILE: property.sh
# 
#         USAGE: ./property.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/31/2015 22:28
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

FILENAME="$1"

echo "Properties for $FILENAME"

if [ -f $FILENAME ]
then
    echo "Size is $(ls -lh $FILENAME \
        | awk '{ print $5 }')"
    echo "Type is $(file $FILENAME \
        | cut -d":" -f2 -)"
    echo "Inode number is $(ls -i \
        $FILENAME | cut -d" " -f1 -)"
    echo "$(df -h $FILENAME | grep \
        -v Mounted | awk '{print "On", $1 ", \
        which is mounted as the", $6, "partition."}')"
fi

