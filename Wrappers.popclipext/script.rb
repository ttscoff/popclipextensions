#!/usr/bin/ruby

prefix = ENV['POPCLIP_OPTION_POPMAKERPREFIX']
suffix = ENV['POPCLIP_OPTION_POPMAKERSUFFIX']
optprefix = ENV['POPCLIP_OPTION_POPMAKEROPTPREFIX']# == "" ? prefix : ENV['POPCLIP_OPTION_POPMAKEROPTPREFIX']
optsuffix = ENV['POPCLIP_OPTION_POPMAKEROPTSUFFIX']# == "" ? suffix : ENV['POPCLIP_OPTION_POPMAKEROPTSUFFIX']
cmdprefix = ENV['POPCLIP_OPTION_POPMAKERCMDPREFIX']# == "" ? prefix : ENV['POPCLIP_OPTION_POPMAKERCMDPREFIX']
cmdsuffix = ENV['POPCLIP_OPTION_POPMAKERCMDSUFFIX']# == "" ? suffix : ENV['POPCLIP_OPTION_POPMAKERCMDSUFFIX']
## Shift key is causing weirdness
# shiftprefix = ENV['POPCLIP_OPTION_POPMAKERSHIFTPREFIX'] == "" ? prefix : ENV['POPCLIP_OPTION_POPMAKERSHIFTPREFIX']
# shiftsuffix = ENV['POPCLIP_OPTION_POPMAKERSHIFTSUFFIX'] == "" ? suffix : ENV['POPCLIP_OPTION_POPMAKERSHIFTSUFFIX']
input = ENV['POPCLIP_TEXT']

# fixes = %w{prefix suffix optprefix optsuffix cmdprefix cmdsuffix shiftprefix shiftsuffix}

# fixes.each {|var|
# 	eval("#{var} ||= #{var} =~ /prefix/ ? prefix : suffix"
# }

space = input.match(/^([\s\n]*)\S.*?([\s\n]*)$/m)
case ENV['POPCLIP_MODIFIER_FLAGS'].to_i
when 1048576 # Command
	print "#{space[1]}#{cmdprefix}#{input.strip}#{cmdsuffix}#{space[2]}"
when 524288 # Option
	print "#{space[1]}#{optprefix}#{input.strip}#{optsuffix}#{space[2]}"
# when 131072 # Shift
# 	print "#{space[1]}#{shiftprefix}#{input.strip}#{shiftsuffix}#{space[2]}"
else # none
	print "#{space[1]}#{prefix}#{input.strip}#{suffix}#{space[2]}"
end



