#!/usr/bin/ruby

# no modifier: highlight
# command: delete
# control: insert
# control-option: change
# option: comment

comment = ENV['POPCLIP_OPTION_CRITICMARKUPCOMMENT']

commentmarkup = comment == "" ? "" : "{>>#{comment} - #{Time.now.strftime('%F %T')}<<}"

date = Time.now.strftime('datetime="%FT%T%z"')
ctrlcmdprefix = "{~~"
ctrlcmdsuffix = "-> ~~}"
ctrlprefix = "{++"
ctrlsuffix = "++}"
cmdprefix = "{--"
cmdsuffix = "--}"
optprefix = "{>>"
optsuffix = "<<}"
prefix = "{=="
suffix = "==}"

input = ENV['POPCLIP_TEXT']

case ENV['POPCLIP_MODIFIER_FLAGS'].to_i
when 1048576 # Command
	print "#{cmdprefix}#{input}#{cmdsuffix}#{commentmarkup}"
when 524288 # Option
	print "#{optprefix}#{comment}: #{input}#{optsuffix}"
when 262144 # Control
	print "#{ctrlprefix}#{input}#{ctrlsuffix}#{commentmarkup}"
when 1310720 # control-command
	print "#{ctrlcmdprefix}#{input}#{ctrlcmdsuffix}#{commentmarkup}"
else # none
	print "#{prefix}#{input}#{suffix}#{commentmarkup}"
end



