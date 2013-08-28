#!/usr/bin/ruby

input = ENV['POPCLIP_TEXT']
# input =<<ENDINPUT
# This is some indented text
#     it has a couple of levels

# and some blank lines
# ENDINPUT

case ENV['POPCLIP_MODIFIER_FLAGS'].to_i
when 1048576 # Command
	input.each {|line| print line =~ /^\s*$/ ? "\n" : line.lstrip }
else
	shortest = false
	input.scan(/^\s*/m).each do |leader|
	    if shortest == false || leader.length < shortest.length
	        shortest = leader
	    end
	end
	print input.gsub(/^#{shortest}/m,'')
end
