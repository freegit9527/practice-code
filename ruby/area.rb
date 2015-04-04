#!/usr/bin/ruby 
#

class Area
    def Area.rect (length, width, units = "inches")
        area = length * width
        printf("The area of this rectangle is %.2f %s.\n",
              area, units)
        sprintf("%.2f", area)
    end
end

Area.rect(12.5, 6)
