#!/bin/bash - 
#===============================================================================
#
#          FILE: compare_str.sh
# 
#         USAGE: ./compare_str.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/31/2015 21:40
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ "$(whoami)" != 'root' ]
then
    echo "You have no permission to run $0 as no-root user."
    exit 1;
fi

# equals to the following:

[ "$(whoami)" != 'root' ] && (echo you are using a non-priviledged \
    account; exit 1 )


gender="female"
if [[ "$gender" == f* ]]
then
    echo "Pleasure to meet you.";
fi

test "$(whoami)" != 'root' && (echo you are using a non-priviledged \
    account; exit 1)
