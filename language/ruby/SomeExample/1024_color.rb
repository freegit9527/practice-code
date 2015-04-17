#!/usr/bin/ruby 

ar = 11.times.collect {|i| 
  2 ** (i + 1)
}
colo = Hash.new

colo[2] = 30
colo[4] = 31
colo[8] = 32
colo[16] = 33
colo[32] = 34
colo[64] = 35
colo[128] = 36
colo[256] = 37
colo[512] = 42
colo[1024] = 45
colo[2048] = 41

ar.each {|item| 
  printf("\033[%dm%5d\033[0m", colo[item], item)
}
puts
