#!/usr/bin/ruby

input = ENV['POPCLIP_TEXT']
output = ""

case ENV['POPCLIP_MODIFIER_FLAGS'].to_i
when 1048576 # Command (remove one level of blockquoting)
	input.each do |line|
		output += line.sub(/^>\s*/,'').strip + "\n"
	end
when 1572864 # Option-Command (remove all blockquoting)
	input.each do |line|
		output += line.gsub(/^(\s*>)*\s*/,'').strip + "\n"
	end
else # Increase quote level by one
	input.each do |line|
		quote = ">"
		tabs = line.scan(/(\t|\s{4})/)
		tabs.each {|m|
			quote += " >"
		} unless tabs.nil?

		# don't quote reference definitions
		unless line =~ /^\s*\[.*?\]: .*/
			output += line =~ /^\s*$/ ? "#{quote}\n" : "#{quote} #{line.strip}\n"
		else
			output += line.chomp + "\n"
		end
	end
end
puts output #.sub(/\n$/s,'')
