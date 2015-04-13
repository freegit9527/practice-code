#!/usr/bin/awk -f
#===============================================================================
#
#          File:  diskrep.awk
# 
#   Description:  
# 
#   VIM Version:  7.0+
#        Author:  YOUR NAME (), 
#  Organization:  
#       Version:  1.0
#       Created:  03/27/2015 08:44
#      Revision:  ---
#       License:  
#===============================================================================

BEGIN { 
	print "*** WARNING WARNING WARNING ***\n"
	}

/\/dev\/sd/ {
	print "Partition " $6 "-------------is " $5 "full."
	}

END { 
	print "*** WARNING WARNING WARNING ***\n"
	}
