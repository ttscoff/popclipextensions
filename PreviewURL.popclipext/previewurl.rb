#!/usr/bin/ruby
debug = ARGV[0] =~ /(debug|-?d)/ ? true : false

# 1.1
# 2013-09-30
#
# Better regex for extracting urls
# Hold down Option to combine lines and fix broken urls
# 	This can cause issues with full urls on consecutive lines, but is handy for a single broken link.
# 	Leaves leading space on lines, so urls broken with an indent are still screwed. Ran into too many problems trying to parse around that.

unless debug
  input = ENV['POPCLIP_TEXT']
else
  input =<<ENDINPUT
surrounding text https://brettterpstra.com other text
ENDINPUT
end

case ENV['POPCLIP_MODIFIER_FLAGS'].to_i
when 524288 || debug # Option
  input = input.split(/[\n\r]/).map {|line|
    line.chomp!
    line =~ /^$/ ? "\n" : line
  }.join("")
end

o = ""
urls = input.scan(/((?:(?:http|https):\/\/)?[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:\/~\+#\(\)_]*[\w\-\@^=%&amp;\/~\+#\(\)])?)/mi)

%x{automator -i "#{urls[0][0]}" PreviewURL.workflow &}
