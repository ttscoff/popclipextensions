#!/usr/bin/ruby

# no modifier: <mark>
# control: <ins datetime></ins>
# command: <del datetime></del>
# option: <!-- -->

include_datetime = ENV['POPCLIP_OPTION_INCLUDEDATETIME']
date = include_datetime.to_i == 1 ? Time.now.strftime(' datetime="%FT%T%z"') : ""
prefix = "<mark>"
suffix = "</mark>"
ctrlprefix = "<ins#{date}>"
ctrlsuffix = "</ins>"
cmdprefix = "<del#{date}>"
cmdsuffix = "</del>"
optprefix = "<!-- "
optsuffix = " -->"

input = ENV['POPCLIP_TEXT']

space = input.match(/^([\s\n]*)\S.*?([\s\n]*)$/m)
case ENV['POPCLIP_MODIFIER_FLAGS'].to_i
when 1048576 # Command
	print "#{space[1]}#{cmdprefix}#{input.strip}#{cmdsuffix}#{space[2]}"
when 524288 # Option
	print "#{space[1]}#{optprefix}#{input.strip}#{optsuffix}#{space[2]}"
when 262144 # ctrl
	print "#{space[1]}#{ctrlprefix}#{input.strip}#{ctrlsuffix}#{space[2]}"
else # none
	print "#{space[1]}#{prefix}#{input.strip}#{suffix}#{space[2]}"
end



