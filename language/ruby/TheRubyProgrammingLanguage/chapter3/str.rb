#!/usr/bin/ruby 

str = 'This include a long \
string'

print "str = <#{str}>\n"

message = 
  'These three literals are ' \
  'concatenated into one by the interpreter.'

print "message = <#{message}>\n" 'hello\n\n' "\n"

escape = %q(Don't worry about escaping ' characters!)
print "#{escape}" "\n"

sentence = %Q|"How about you?", he said|
print "#{sentence}" "\n"

newline = %-This string literal ends with a newline\n-
print "#{newline}"

state = %((1 + (2 * 3)) = #{(1 + (2 * 3))})
print "#{state}" "\n"


