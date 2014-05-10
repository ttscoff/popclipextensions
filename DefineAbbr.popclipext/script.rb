		#!/System/Library/Frameworks/Ruby.framework/Versions/Current/usr/bin/ruby

		require 'cgi'

		url = "http://www.textingabbreviations.ca/{query}/"
		query = ENV['POPCLIP_TEXT']
		url.sub!(/\{query\}/,CGI.escape(query))

		%x{open "#{url}"}
