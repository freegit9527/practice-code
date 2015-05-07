#!/usr/bin/ruby 

$arr = []
$arr[0] = 2;

def get_prime_below(n)
  3.step(n, 2) {|n| $arr << n if is_prime?n}
  print $arr.join(", "), "\n"
end 

def is_prime?(num)
  index = 0;
  while $arr[index] * $arr[index] <= num 
    return false if num % $arr[index] == 0
    index += 1
  end
  true
end

get_prime_below(50)
