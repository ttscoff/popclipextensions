#!/usr/bin/ruby

if ARGV[0] =~ /\-?d(ebug)?/
	input = STDIN.read
	# ENV['POPCLIP_MODIFIER_FLAGS'] = 1048576.to_s # Command
	# ENV['POPCLIP_MODIFIER_FLAGS'] = 524288.to_s # Option
	column = 80
	altcolumn = 60
else
	input = ENV['POPCLIP_TEXT']
	column = ENV['POPCLIP_OPTION_COLUMN'].to_i
	altcolumn = ENV['POPCLIP_OPTION_ALTCOLUMN'].to_i
end


class String
	def wrap(col = 80)
	  self.gsub(/(.{1,#{col}})( +|$)\n?|(.{#{col}})/, "\\1\\3\n").strip
	end

	def unwrap
		self.split(/\n{2,}/).map {|para| para.gsub(/(\S *)\n( *\S)/, '\1 \2')}.join("\n\n").strip
	end
end

trail_match = input.match(/(?i-m)[\s\n\t]++$/)
trailing = trail_match.nil? ? "" : trail_match[0]

output = []

case ENV['POPCLIP_MODIFIER_FLAGS'].to_i
when 1048576 # Command - Unwrap
	print input.unwrap
when 524288 # Option - Wrap at alternate column
	print input.wrap(altcolumn)
else # Wrap at default column
	print input.wrap(column)
end

print trailing
