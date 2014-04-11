#!/usr/bin/ruby
require 'shellwords'

# 1.0
# 2014-04-09
#
# Sums all numbers found in selection

debug = ARGV[0] =~ /(debug|-?d)/ ? true : false
decimal = ENV['POPCLIP_OPTION_DELIMITER']
separator = ENV['POPCLIP_OPTION_SEPARATOR']

def esc(char)
  return "\\#{char}"
end

def fmt( st, decimal, separator )
  mynum = st.to_s.reverse.scan(/(?:\d*#{esc(decimal)})?\d{1,3}-?/).join(separator).reverse
  dec = mynum.split(decimal)
  mynum = dec[0].to_s + decimal + dec[1].to_s if dec[1]
  mynum
end

begin
  unless debug
    if RUBY_VERSION.to_f > 1.9
      Encoding.default_external = Encoding::UTF_8
      Encoding.default_internal = Encoding::UTF_8
      input = ENV['POPCLIP_TEXT'].dup.force_encoding('utf-8')
    else
      input = ENV['POPCLIP_TEXT'].dup
    end
  else
    input = STDIN.read
  end

  total = 0
  places = 0

  input.scan(/(\-?[\d#{esc(separator)}]+(#{esc(decimal)}\d+)?)\b/).each {|x|
    total += x[0].gsub(/#{esc(separator)}/,'').sub(/#{esc(decimal)}/,'.').to_f
    places = x[1].length - 1 if x[1] && x[1].length.to_i > places + 1
  }

  # minimum 2 decimal places if any
  places = 2 if places == 1

  out = "%.#{places.to_i}f" % total
  do_format = ENV['POPCLIP_OPTION_FORMATOUTPUT'].to_i == 1 ? true : false
  print do_format ? fmt(out.sub(/\./,decimal), decimal, separator) : out.sub(/\./,decimal)
rescue Exception => e
  %x{logger #{Shellwords.escape(e.to_s)}}
  STDERR.puts e
end
