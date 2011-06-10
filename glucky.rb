#!/usr/bin/env ruby

require 'net/http'

word =STDIN.read
prefix = "http://www.google.com/search?q="
suffix = "&btnI=I'm+Feeling+Lucky"
goodURL = URI.escape(prefix + word + suffix)
response = Net::HTTP.get_response(URI.parse(goodURL))
print response.to_hash['location']