#!/usr/bin/env ruby
debug = ARGV[0] =~ /(debug|-?d)/ ? true : false

unless debug
  input = ENV['POPCLIP_TEXT']
else
  input =<<ENDINPUT
surrounding text https://brettterpstra.com other text

Today's 9:30 Coffee Break: False Beginnings. (More on the Blog - http://minnesota.publicradio.org/collections/special/columns/music_blog/archive/2010/05/monday_coffee_b_31.shtml)

ENDINPUT
end

output = input.dup
urls = input.scan(/((?:(?:http|https):\/\/)[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:\/~\+#\(\)_]*[\w\-\@^=%&amp;\/~\+#\(\)])?)/mi)

urls.each {|url|

  if url.length == 3

    url = url[0]

    if url =~ /\)/ && url !~ /\(/
      url = url.sub(/\).*?$/,'')
    end

    new_url = %x{automator -i "#{url}" PreviewURL.workflow 2>/dev/null}.strip
    if new_url && new_url.length > 0
      output.sub!(/#{url}/,new_url)
    end
  end
}
print output

