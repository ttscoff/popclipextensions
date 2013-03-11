#!/usr/bin/ruby

input = ENV['POPCLIP_TEXT']

if input.split("\n").length > 1
	output = ""
	input.split("\n").each {|line|
	  output += "\t#{line}\n"
	}
	print output.sub(/\n$/s,'')
else
	head = input =~ /^(\s+)/ ? $1 : ''
	tail = input =~ /(\s+)$/ ? $1 : ''
	print "#{head}`#{input.strip}`#{tail}"
end
