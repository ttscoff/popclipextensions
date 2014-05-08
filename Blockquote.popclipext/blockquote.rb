#!/usr/bin/ruby

if ARGV[0] =~ /\-?d(ebug)?/
	input = STDIN.read
	# ENV['POPCLIP_MODIFIER_FLAGS'] = 1048576.to_s
else
	input = ENV['POPCLIP_TEXT']
end

def trailing_whitespace(input)
	out = []
	input.reverse.each {|line|
		if line =~ /^([\s\t])*$/
			out.push("#{$1}")
		else
			break
		end
	}
	out.reverse.join("\n")
end

def quote_block(input)
	while input[-1] =~ /^\s*$/
		input.pop
	end
	output = ""
	input.each do |line|
		quote = ">"
		tabs = line.match(/^([\s\t]+)/)

		unless tabs.nil?
			count = tabs[1].gsub(/\t/,"    ").length / 4
			count.times do
				quote += " >"
			end
		end

		# don't quote reference definitions
		unless line =~ /^\s*\[.*?\]: .*/
			output += line =~ /^\s*$/ ? "#{quote}\n" : "#{quote} #{line.sub(/^[\s\t]*/,'')}\n"
		else
			output += line
		end
	end
	output
end

trail_match = input.match(/(?i-m)[\s\n\t]++$/)
trailing = trail_match.nil? ? "" : trail_match[0]

input = input.split("\n")
output = []

case ENV['POPCLIP_MODIFIER_FLAGS'].to_i
when 1048576 # Command (remove one level of blockquoting)
	input.each do |line|
		output.push(line.sub(/^(\s*)>\s*/,'\1'))
	end
when 1572864 # Option-Command (remove all blockquoting)
	input.each do |line|
		output.push(line.sub(/^(\s*)(>\s*)*/,'\1'))
	end
else # Increase quote level by one
	block = []
	skipping = false
	input.each_with_index do |line, i|
		if line =~ /\S/ && skipping
			skipping = false
			block = [line]
		elsif line =~ /^\s*$/ && (input[i+1] =~ /^\s*$/ || i == input.length - 1) && !skipping
			skipping = true
			output.push(quote_block(block)) unless block.empty?
			block = []
		elsif line =~ /^\s*$/ && skipping
			next
		else
			block.push(line)
		end
	end
	output.push(quote_block(block)) unless block.empty?
end

print output.join("\n") + trailing #.sub(/\n$/s,'')

