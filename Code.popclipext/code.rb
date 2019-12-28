#!/usr/bin/env ruby

input = ENV['POPCLIP_TEXT']

if input =~ /(`+).*?\1/m
  print input.gsub(/(`+)\n?(.*?)\n?\1/m, '\2')
else
  if input.split("\n").length > 1
    # output = ""
    # input.split("\n").each {|line|
    #   output += "\t#{line}\n"
    # }
    # print output.sub(/\n$/s,'')
    ## Switching to using fenced code blocks
    print "```\n#{input}\n```\n"
  else
    head = input =~ /^(\s+)/ ? $1 : ''
    tail = input =~ /(\s+)$/ ? $1 : ''
    print "#{head}`#{input.strip}`#{tail}"
  end
end
