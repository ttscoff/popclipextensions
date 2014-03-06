#!/usr/bin/ruby
require 'cgi'
require 'open-uri'
require 'net/http'
require 'rexml/document'
require 'shellwords'

debug = ARGV[0] =~ /(debug|-?d)/ ? true : false

# 1.0
# 2014-03-06


unless debug
  orig_input = ENV['POPCLIP_TEXT'].dup
else
  orig_input = "Brought to you by http://bit.ly/1hQ92Iz and http://brettterpstra.com"
end

input = orig_input.dup

strip_all_queries = false
only_links = false

case ENV['POPCLIP_MODIFIER_FLAGS'].to_i
when 524288 # Option
  strip_all_queries = true
when 1048576
  only_links = true
when 1572864
  strip_all_queries = true
  only_links = true
end

class String
  def clean_google
    return self.gsub(/[?&]utm_[scm].+=[^&?\n\s\r!,.\)\]]++/,'')
  end

  def clean_queries
    return self.sub(/(.*?)\?\S+/,"\\1")
  end
end

begin
  o = []
  input.gsub!(/((?:(?:http|https):\/\/)?[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:\/~\+#\(\)_]*[\w\-\@^=%&amp;\/~\+#\(\)])?)/mi) {|url|
    if url =~ /https?:\/\/[\da-z]+\.[a-z]{2}\/[A-Za-z0-9]+/
      res = Net::HTTP.get(URI.parse("http://api.longurl.org/v2/expand?format=xml&url=#{CGI.escape(url)}"))
      doc = REXML::Document.new(res.strip)
      url = doc.elements["response/long-url"].text
    end
    url = url.clean_google
    url = url.clean_queries if strip_all_queries || debug
    o.push(url)
    url
  }

  # urls.each {|url|
  #   if url.length == 3 && url.join("") !~ /^[\d\.]+$/

  #   	url = url[0]

  #   	if url =~ /\)/ && url !~ /\(/
  #   		url = url.sub(/\).*?$/,'')
  #   	end

  #     target = url =~ /^http/ ? url : "http://#{url}"
  #     o += target + "\n"
  #   end
  # }
  if only_links
    puts o.join("\n")
  else
    print input
  end
rescue Exception => e
  p e if debug
end
