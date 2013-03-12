#!/usr/bin/ruby

input = ENV['POPCLIP_TEXT']
# input =<<ENDINPUT
# This is some indented text
#     it has a couple of levels

# and some blank lines
# ENDINPUT

shortest = false
input.scan(/^\s*/m).each do |leader|
    if shortest == false || leader.length < shortest.length
        shortest = leader
    end
end
print input.gsub(/^#{shortest}/m,'')
