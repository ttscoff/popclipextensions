#!/usr/bin/env ruby
require 'shellwords'

input = ENV['POPCLIP_TEXT']

res = `echo #{Shellwords.escape(input)} | automator -i - ~/Library/Services/SearchLink.workflow`.strip

res.gsub!(/'/, "\\\\'")
res.gsub!(/^\(/, '[')
res.gsub!(/\)$/, ']')
res.gsub!(/^  "/, "'")
res.gsub!(/",? *$/, "',")

data = eval(res)

print data.join("\n")
