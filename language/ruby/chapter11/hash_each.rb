#!/usr/bin/ruby 

sum = 0
outcome = {
          "Participate" => 1000,
          "Fee" => 1000, "Metting" => 4000}

outcome.each { |pair|
  sum += pair[1]
}

puts "total: #{sum}."
