#!/usr/bin/ruby
debug = ARGV[0] =~ /(debug|-?d)/ ? true : false

# 2.0 2020-01-06
# : Handle multiple URLs
# : Don't recognize urls without protocol
# : Show popup centered on current display

unless debug
  input = ENV['POPCLIP_TEXT']
else
  input =<<ENDINPUT
surrounding text https://brettterpstra.com other text

Today's 9:30 Coffee Break: False Beginnings. (More on the Blog - http://minnesota.publicradio.org/collections/special/columns/music_blog/archive/2010/05/monday_coffee_b_31.shtml)

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
urls = input.scan(/((?:(?:http|https):\/\/)[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:\/~\+#\(\)_]*[\w\-\@^=%&amp;\/~\+#\(\)])?)/mi)

urls.each {|url|
  if url.length == 3

    url = url[0]

    if url =~ /\)/ && url !~ /\(/
      url = url.sub(/\).*?$/,'')
    end

    unless debug
      %x{automator -i "#{url}" PreviewURL.workflow &}
    else
      o += url + "\n"
      %x{automator -i "#{url}" PreviewURL.workflow &>/dev/null}
    end
  end
}
print o if debug
# %x{automator -i "#{urls[0][0]}" PreviewURL.workflow &}
