#!/usr/bin/env ruby

require 'uri'

print URI.encode(ENV['POPCLIP_TEXT'])
