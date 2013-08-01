#!/usr/bin/ruby
def e_sh(str)
  str.to_s.gsub(/(?=[^a-zA-Z0-9_.\/\-\x7F-\xFF\n])/, '\\').gsub(/\n/, "'\n'").sub(/^$/, "''")
end

input = ENV['POPCLIP_TEXT']

pboard = %x{pbpaste}.strip

%x{echo #{e_sh(pboard + "\n" + input)}|__CF_USER_TEXT_ENCODING=0x1F5:0x8000100:0x8000100 pbcopy}
