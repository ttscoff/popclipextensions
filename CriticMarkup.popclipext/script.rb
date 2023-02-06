#!/usr/bin/ruby

# no modifier: highlight
# command: delete
# control: insert
# control-command: change
# shift: comment

comment = ENV['POPCLIP_OPTION_CRITICMARKUPCOMMENT']

commentmarkup = comment == '' ? '' : "{>>#{comment} - #{Time.now.strftime('%F %T')}<<}"

ctrlcmdprefix = '{~~'
ctrlcmdsuffix = '~> ~~}'
ctrlprefix = '{++'
ctrlsuffix = '++}'
cmdprefix = '{--'
cmdsuffix = '--}'
shiftprefix = '{>>'
shiftsuffix = '<<}'
prefix = '{=='
suffix = '==}'

input = ENV['POPCLIP_TEXT']

case ENV['POPCLIP_MODIFIER_FLAGS'].to_i
when 1048576 # Command
	print "#{cmdprefix}#{input}#{cmdsuffix}#{commentmarkup}"
when 131072 # Shift
	print "#{shiftprefix}#{comment}: #{input}#{shiftsuffix}"
when 262144 # Control
	print "#{ctrlprefix}#{input}#{ctrlsuffix}#{commentmarkup}"
when 1310720 # control-command
	print "#{ctrlcmdprefix}#{input}#{ctrlcmdsuffix}#{commentmarkup}"
else # none
	print "#{prefix}#{input}#{suffix}#{commentmarkup}"
end
