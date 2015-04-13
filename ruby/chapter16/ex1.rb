#!/usr/bin/ruby 

str = "liuxueyang@163.com"

%r|^([^@]+)@(.*)$| =~ str

print "Username: ", $1, "\ndomain: ", $2, "\n"

#ANOTHER ANSWER

def get_local_and_domain(str) 
  %r|^([^@]+)@(.*)$| =~ str 
  localpart = $1
  domain = $2
  return [localpart, domain]
end

p get_local_and_domain("info@example.com")
