#!/usr/bin/ruby
debug = ARGV[0] =~ /(debug|-?d)/ ? true : false

# 1.0
# 2013-09-30
#
# Fixes emails obscured like "support AT mydomain DOT com"
# Hold down Option to open also a mailto link for matched addresses

unless debug
  input = ENV['POPCLIP_TEXT'].dup
else
  input =<<ENDINPUT
  "rick AT rolled DOT com"
  me AT your DOT moms DOT house DOT com

  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore me AT your DOT moms DOT house DOT com et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse me DOT other AT your DOT moms DOT house DOT com cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
ENDINPUT
end

if input.nil?
  exit 0
end
begin
  input.gsub!(/\b(([a-z0-9]+)(\s+DOT\s+([a-z]+?))?\s+AT\s+[a-z0-9]+(\s+DOT\s+[a-z0-9]+)*\s+DOT\s+([a-z]{2,5}))\b/mi) do |match|
    match = $1

    new_address = match.gsub(/\s+AT\s+/,"@").gsub(/\s+DOT\s+/,".").gsub(/\s+/,"").strip

    case ENV['POPCLIP_MODIFIER_FLAGS'].to_i
    when 524288 # Option
      %x{open "mailto:#{new_address.strip}"}
    end

    new_address
  end

  print input
rescue Exception => e
  p e
ensure # this way makes it easier to debug. Sue me.
  exit 0
end
