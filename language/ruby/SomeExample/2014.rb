#!/usr/bin/ruby 

require "io/console"

mar = Array.new(16, 0) # sheet value array

printf("%s%s%s\n%s", " " * 8 + "/", ("-" * 6 + "+") * 3,
      "-" * 6 + "\\", " " * 8)

16.times { |i|
  printf("|%5d ", mar[i])
  if (i+1) % 4 == 0 
    printf("|\n") 
    if (i+1) != 16
      printf("%s%s%s\n%s", " " * 8 + "|", ("-" * 6 + "+") * 3,
            "-" * 6 + "|", " " * 8)
    else 
      printf("%s%s%s\n%s", " " * 8 + "\\", ("-" * 6 + "+") * 3,
            "-" * 6 + "/", " " * 8)
    end 
  end 
}

