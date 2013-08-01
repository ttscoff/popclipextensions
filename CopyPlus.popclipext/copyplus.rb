#!/usr/bin/ruby
require 'shellwords'

input = ENV['POPCLIP_TEXT']

pboard = %x{pbpaste}

%x{echo #{Shellwords.shellescape(pboard + "\n" + input)}|__CF_USER_TEXT_ENCODING=0x1F5:0x8000100:0x8000100 pbcopy}
