#!/usr/bin/ruby 

require "io/console"

mar = Array.new(16, 0) # sheet value array
ran = [2, 4] # generate random new value
r_pos = Random.new # get pos random seed

def manu(mar, ran, gap) 
  ran.each { |index| 
    ar = index.step(index + 3 * gap, gap).collect { |in| in}
  }
end

def add?(mar, direc)
  case 
  when direc == "j"
end

def lose?(mar) 
  cnt = mar.count(0)
  return cnt == 0 ? true : false
end

# print sheet
def sheet(mar) 
  mar.each_with_index { |i, index| 
    printf("%4d", i) unless i == 0
    printf("%4s", "*") if i == 0
    puts if (index + 1) % 4 == 0
  }
end

5.times {
  pos = r_pos.rand(16)
  while mar[pos] != 0 
    r_pos = Random.new
    pos = r_pos.rand(16)
  end

  r_val = Random.new 
  val = r_val.rand(2)
  mar[pos] = ran[val]
  sheet(mar)
  printf("%s\n", "*" * 20)
}
