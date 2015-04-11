#!/usr/bin/ruby 
#

require "net/http"
require "uri"

url = URI.parse("http://www.ruby-lang.org/en/")
http = Net::HTTP.start(url.host, url.port)
doc = http.get(url.path)
puts doc

p url.scheme
p url.host
p url.port
p url.path
p url.to_s
