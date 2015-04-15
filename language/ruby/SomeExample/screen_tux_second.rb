#!/usr/bin/ruby 

require 'io/console'

character = <<ENDD
        .--.
       |o_o |
       |:_/ |
      //   \\ \\
     (|     | )
    /'\\_   _/`\\
    \\___)=(___/
ENDD


ran_col, ran_row = IO.console.winsize
ran_row -= 7
ran_col -= 17

def print_character(row, column, character, ran_row, ran_col)
  if row <= 0 ||
    column <= 0 ||
    row >= ran_row || 
    column >= ran_col
    return
  end
#  if column <= 0
#    column = ran_col
#  end
#
#  if row >= ran_row 
#    row = 0
#  end
#  if column >= ran_col 
#    column = 0
#  end

  row.times {puts}
  column.times {print " "}
  puts
  character.split("\n").each { |item|
    column.times {print " "}
    print item
    puts
  }
end 

while true do 
  #system "clear"
  c = Random.new
  column = c.rand(ran_col) + 1

  r = Random.new
  row = r.rand(ran_row) + 1

  while true 
    system "clear"
    if column >= ran_col ||
      row >= ran_row ||
      column <= 0 || 
      row <= 0
      break;
    else 
      direc = Random.new 
      va = direc.rand(2)
      if va == 0
        column += 2
        row += 2
      else 
        column -= 2
        row -= 2
      end
      print_character(row, column, character, ran_row, ran_col)
      sleep(0.1)
    end 
  end
end

