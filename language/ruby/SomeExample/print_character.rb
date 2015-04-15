#!/usr/bin/ruby 

row = 3
column = 5
character = <<ENDD
        .--.
       |o_o |
       |:_/ |
      //   \\ \\
     (|     | )
    /'\\_   _/`\\
    \\___)=(___/
ENDD

row.times {puts}
column.times {print " "}
puts
character.split("\n").each { |item|
  column.times {print "-"}
  print item
  puts
}
