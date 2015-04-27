#!/usr/bin/ruby 

passwd = File.open('/etc/passwd')
puts passwd.fileno

hosts = File.open('/etc/hosts')
puts hosts.fileno

passwd.close

null = File.open('/dev/null')
puts null.fileno

puts STDIN.fileno
puts STDOUT.fileno
puts STDERR.fileno

