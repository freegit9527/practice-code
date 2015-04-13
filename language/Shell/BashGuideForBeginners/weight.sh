#!/bin/bash - 
#===============================================================================
#
#          FILE: weight.sh
# 
#         USAGE: ./weight.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/31/2015 21:57
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ ! $# == 2 ]
then
    echo "Usage: $0 weight_in_kilos \
        length_in_centimeters"
    exit
fi

weight="$1"
height=$2;
echo "weight = $weight";
echo "height = $height";

idealweight=$[$height - 110]
if [ $weight -le $idealweight ]
then
    echo "You should eat a bit more fat."
else
    echo "You should eat a bit more fruit."
fi


