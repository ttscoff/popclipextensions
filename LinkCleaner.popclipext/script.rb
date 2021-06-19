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
  strip_all_queries = ENV['POPCLIP_OPTION_GAONLY'].to_i == 0
  orig_input = ENV['POPCLIP_TEXT'].dup
else
  strip_all_queries = true
  orig_input = "Brought to you by http://bit.ly/1hQ92Iz and http://brettterpstra.com, https://clutchpoints.com/clippers-news-rajon-rondo-speaks-out-after-clippers-debut-vs-lakers/?fbclid=IwAR3epED82RKaRTrmL4X_uBCoVjU6mmFxFhZcAXshKwMzm17RuAT_oxxteiE"
end

input = orig_input.dup

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
    url = url.clean_google
    url = url.clean_queries if strip_all_queries || debug
    o.push(url)
    url
  }

  if only_links
    puts o.join("\n")
  else
    print input
  end
rescue Exception => e
  print orig_input
end
