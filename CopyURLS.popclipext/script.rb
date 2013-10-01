#!/usr/bin/ruby
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
  input = ENV['POPCLIP_TEXT']
else
  input =<<ENDINPUT
Sponsored by [TextExpander](http://smilesoftware.com/systematic?crcat=systematic&crsource=te&crcampaign=oct01) (coupon code **SYSTEMATIC**), [SquareSpace](http://squarespace.com) (coupon code **CANDYCORN**), and [MailChimp](http://mailchimp.com/5by5).

http://snipplr.com/view/2371/regex-regular
-expression-to-match-a-url/

<http://linkbun.ch/api.php?
PHPSESSID=5a5de3bb47bd30865b64478376160e00>

http://www.google.com/support/a/bin/answer.py?answer=37673
http://www.google.com/search?client=safari&rls=en&q=share+multiple+links&ie=UTF-8&oe=UTF-8

http://en.wikipedia.org/wiki/Ed_Roberts_(computer_engineer)

www.google.com/support/a/bin/answer.py?answer=37673

http://postable.weblogzinc.com/?blog=tuaw-we, http://postable.weblogzinc.com/?blog=tuaw-we
(http://postable.weblogzinc.com/?blog=tuaw-we).

~@emmaboulton Talk to (http://www.premiumcollections.co.uk). They were good in getting me a result with one wanker who took the piss.

Blog Post: Allan Haley Interviewed at Web 2.0 Expo <span class="caps">SF</span> 2010 About Web Fonts http://blog.fonts.com/?p=563 blog.fonts.com/?p=563

Today's 9:30 Coffee Break: False Beginnings. More on the Blog - http://minnesota.publicradio.org/collections/special/columns/music_blog/archive/2010/05/monday_coffee_b_31.shtml

Review: iHome+Sleep for iPhone "http://www.pheedcontent.com/click.phdo?i=24518775cad8deb8f509fd82f53afe9a&utm_source=mactweets&utm_medium=twitter"
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

urls.each {|url|
  if url.length == 3 && url.join("") !~ /^[\d\.]+$/

  	url = url[0]

  	if url =~ /\)/ && url !~ /\(/
  		url = url.sub(/\).*?$/,'')
  	end

    target = url =~ /^http/ ? url : "http://#{url}"
    o += target + "\n"
  end
}
print o
