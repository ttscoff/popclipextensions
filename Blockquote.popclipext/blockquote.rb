#!/usr/bin/ruby

input = ENV['POPCLIP_TEXT']
output = ""
input.each do |line|
	quote = ">"
	tabs = line.scan(/(\t|\s{4})/)
	tabs.each {|m|
		quote += ">"
	} unless tabs.nil?
	output += line =~ /^\s*$/ ? "\n" : "#{quote} #{line.strip}\n"
end
print output.sub(/\n$/s,'')
