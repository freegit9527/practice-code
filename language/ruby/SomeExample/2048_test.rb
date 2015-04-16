#!/usr/bin/ruby 

require "io/console"

mar = Array.new(16, 0) # sheet value array

def operate(mar, ran, gap)
  mark = false
  ran.each { |index| 
    ar = index.step(index + 3 * gap, gap).collect { |ind| ind}
    tm_ar = ar.collect{|ie| mar[ie]}
    pre_tm_ar = tm_ar.clone
    tm_ar.delete_if{|item| item == 0}
    (0..(tm_ar.size-1)).each {|ie|
      if tm_ar[ie] == tm_ar[ie+1]
        tm_ar[ie] *= 2
        tm_ar[ie+1] = 0
      end 
    }
    tm_ar.delete_if{|item| item == 0}
    (4-tm_ar.size).times {
      tm_ar << 0
    }
    tm_ar.size.times {|item|
      mar[ar[item]] = tm_ar[item]
    }
    mark = true if tm_ar == pre_tm_ar
#    pos = tm_ar.size
#    (pos...4).each {|item|
#      mar[ar[item]] = 0
#    }
  }
  #sheet(mar)
  mark
end

def myloop(mar, a_pos, gap) 
  a_pos.each{|item|
    3.times {|i|
      if mar[item+i] == mar[item+i+gap]
        return true
      end 
    }
  }
  false
end

def judge_lose_full(mar) 
  ro = [0, 4, 8, 12]
  col = [0, 1, 2, 3]
  !myloop(mar, ro, 1) && !myloop(mar, col, 4)
end

def lose?(mar) 
  cnt = mar.count(0)
  return cnt == 0 ? judge_lose_full(mar) : false
end

def win?(mar) 
  max_value = mar.sort[-1]
  return max_value == 2048 ? true : false
end

def genera_num(mar) 
  r_pos = Random.new # get pos random seed
  ran = [2, 4] # generate random new value
  pos = r_pos.rand(16)
  while mar[pos] != 0 
    r_pos = Random.new
    pos = r_pos.rand(16)
  end

  r_val = Random.new 
  val = r_val.rand(2)
  mar[pos] = ran[val]

end

def add(mar, direc)
  mark = false;
  case 
  when direc == "j"
    mark = operate(mar, Array(12..15), -4) #j
  when direc == "k"
    mark = operate(mar, Array(0..3), 4) #k
  when direc == "h"
    mark = operate(mar, [0, 4, 8, 12], 1) #h
  when direc == "l"
    mark = operate(mar, [3, 7, 11, 15], -1) #l
  end
  if mark 
    genera_num(mar)
  end
end

# print sheet
def sheet(mar) 
  mar.each_with_index { |i, index| 
    printf("%4d", i) unless i == 0
    printf("%4s", "*") if i == 0
    puts if (index + 1) % 4 == 0
  }
  printf("%s\n", "*" * 20)
end


genera_num(mar)
while true
  sheet(mar)
  direc = STDIN.getch
  add(mar, direc)

  if win?(mar) 
    puts "Congratulations! You Win!"
    break
  end

  if lose?(mar) 
    puts "Sorry, You are a loser..."
    break
  end
  system "clear"
end 

