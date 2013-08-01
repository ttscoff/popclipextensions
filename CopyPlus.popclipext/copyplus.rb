#!/usr/bin/ruby
require 'shellwords'

input = ENV['POPCLIP_TEXT']

pboard = %x{__CF_USER_TEXT_ENCODING=$UID:0x8000100:0x8000100 pbpaste}.strip

%x{echo #{Shellwords.escape(pboard + "\n" + input)}|pbcopy}
