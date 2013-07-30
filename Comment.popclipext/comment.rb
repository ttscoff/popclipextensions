#!/usr/bin/ruby

input = ENV['POPCLIP_TEXT']
case ENV['POPCLIP_MODIFIER_FLAGS'].to_i
when 1048576 # Command (Hash)
	print input.split("\n").map {|line|
		"# #{line}"
	}.join("\n")
when 524288 # Option (CSS)
	space = input.match(/^((?:\n\s*)*)\S.*?((?:\n\s*)*)$/m)
	print "#{space[1]}/* #{input.strip} */#{space[2]}"
when 1572864 # Option-Command (Slash)
	print input.split("\n").map {|line|
		"// #{line}"
	}.join("\n")
else # none (HTML)
	space = input.match(/^([\s\n]*)\S.*?([\s\n]*)$/m)
	print "#{space[1]}<!-- #{input.strip} -->#{space[2]}"
end
