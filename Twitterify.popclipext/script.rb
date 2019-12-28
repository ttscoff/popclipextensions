#!/usr/bin/ruby
require 'shellwords'

debug = ARGV[0] =~ /(debug|-?d)/ ? true : false

# Convert @ttscoff to
#   [@ttscoff](https://twitter.com/ttscoff)
# Convert #hashtag to
#   [#hashtag](https://twitter.com/search?q=%23hashtag&src=hash)

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
