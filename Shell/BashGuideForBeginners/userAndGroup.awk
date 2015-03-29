#!/usr/bin/awk -f
#===============================================================================
#
#          File:  userAndGroup.awk
# 
#   Description:  
# 
#   VIM Version:  7.0+
#        Author:  YOUR NAME (), 
#  Organization:  
#       Version:  1.0
#       Created:  03/27/2015 08:59
#      Revision:  ---
#       License:  
#===============================================================================

BEGIN {
	FS=":"
	}

	{print $1 "\t" $5}
