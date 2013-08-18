#!/usr/bin/ruby
require 'shellwords'

input = ENV['POPCLIP_TEXT']

def outdent(input)
	shortest = false
	input.scan(/^\s*/m).each do |leader|
		if shortest == false || leader.length < shortest.length
			shortest = leader
		end
	end
	input.gsub(/^#{shortest}/m,'').strip
end

# initial outdent and create array
lines = outdent(input).split("\n")


# Remove blank lines
lines.delete_if {|line| line =~ /^\s*$/}


# Handle converting headlines and lists to indented outline
last_level = 0
lines.map! {|line|
	if line =~ /^#\s/
		line.gsub!(/^# /,"")
		last_level = 1
	elsif line =~ /^## /
		line.gsub!(/^## /,"\t")
		last_level = 2
	elsif line =~ /^### /
		line.gsub!(/^### /,"\t\t")
		last_level = 3
	elsif line =~ /^#### /
		line.gsub!(/^#### /,"\t\t\t")
		last_level = 4
	elsif line =~ /^##### /
		line.gsub!(/^##### /,"\t\t\t\t")
		last_level = 5
	elsif line =~ /^###### /
		line.gsub!(/^###### /,"\t\t\t\t\t")
		last_level = 6
	else
		line.gsub!(/(\s*)(\d\.|[\-\*\+])\s/,"\\1")
		line.gsub!(/\s{4}/,"\t") unless line.nil?
		last_level.times do
			line = "\t" + line
		end
	end
	line.chomp
}

# Copy to cliipboard
# %x{printf #{Shellwords.escape(outdent(lines.join("\n")).strip)}|pbcopy}

print outdent(lines.join("\n")).strip
