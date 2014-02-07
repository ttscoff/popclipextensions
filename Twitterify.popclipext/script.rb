#!/usr/bin/ruby
require 'shellwords'

debug = ARGV[0] =~ /(debug|-?d)/ ? true : false

# 1.0
# 2013-09-30
#
# Duplicate of OpenURLs, but copies a plain, newline-separated list to the clipboard
# Better regex for extracting urls
# Hold down Option to combine lines and fix broken urls
# 	This can cause issues with full urls on consecutive lines, but is handy for a single broken link.
# 	Leaves leading space on lines, so urls broken with an indent are still screwed. Ran into too many problems trying to parse around that.

unless debug
  input = ENV['POPCLIP_TEXT'].dup
else
  input =<<ENDINPUT
#something From @ttscoff with #popclip
ENDINPUT
end

usemarkdown = debug ? 1 : ENV['POPCLIP_OPTION_USEMARKDOWN']
markdown = usemarkdown.to_i == 1 ? true : false

case ENV['POPCLIP_MODIFIER_FLAGS'].to_i
when 524288 || !debug # Option
  markdown = !markdown
end

begin
  input.gsub!(/(\s|^)([@#]\w+)/) {|p|
    match = $2.strip
    if match[0] == "@"
      markdown ? "#{$1}[#{match}](https://twitter.com/#{match[1..-1]})" : "#{$1}<a href=\"https://twitter.com/#{match[1..-1]}\" title=\"#{match[1..-1]} on Twitter\">#{match}</a>"
    elsif match[0] == "#"
      markdown ? "#{$1}[\\#{match}](https://twitter.com/search?q=%23#{match[1..-1]}&src=hash)" : "#{$1}<a href=\"https://twitter.com/search?q=%23#{match[1..-1]}&src=hash\">#{match}</a>"
    else
      "#{$1}#{match}"
    end
  }
  print input
rescue Exception => e
  %x{logger #{Shellwords.escape(e.to_s)}}
  STDERR.puts e
end
