#!/usr/bin/ruby 

require 'io/console'

character1 = <<ENDD
        .--.
       |o_o |
       |:_/ |
      //   \\ \\
     (|     | )
    /'\\_   _/`\\
    \\___)=(___/
ENDD

character = <<END
*
END

ran_col, ran_row = IO.console.winsize

def print_character(row, column, character, ran_row, ran_col)
  if row >= ran_row || column >= ran_col
    return
  end

  row.times {puts}
  column.times {print " "}
  puts
  character.split("\n").each { |item|
    column.times {print " "}
    print item
    puts
  }
end 

system "clear"
printf("row = %d column = %d\n", ran_row, ran_col)
sleep(3)

column, row = [0, 0]
while true 
  system "clear"
  if column >= ran_col ||
    row >= ran_row #||
    break;
  else 
      column += 2
      row += 2
    print_character(row, column, character, ran_row, ran_col)
    sleep(0.1)
  end 
end
