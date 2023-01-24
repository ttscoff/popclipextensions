#!/usr/bin/env ruby
# frozen_string_literal: true

require 'shellwords'

input = ENV['POPCLIP_TEXT']

def install_searchlink
  user = `whoami`.strip
  unless File.exist?(File.expand_path("/Users/#{user}/Library/Services/SearchLink.workflow"))
    folder = File.expand_path("/Users/#{user}/Downloads")
    services = File.expand_path("/Users/#{user}/Library/Services")
    dl = File.join(folder, 'SearchLink.zip')
    `curl -SsL -o "#{dl}" https://github.com/ttscoff/searchlink/releases/latest/download/SearchLink.zip`
    Dir.chdir(folder)
    `unzip -qo #{dl} -d #{folder}`
    FileUtils.rm(dl)

    ['SearchLink.workflow', 'SearchLink File.workflow', 'Jump to SearchLink Error.workflow'].each do |wflow|
      src = File.join(folder, 'SearchLink Services', wflow)
      dest = File.join(services, wflow)
      FileUtils.rm_rf(dest) if File.exist?(dest)
      FileUtils.mv(src, dest, force: true)
    end
    FileUtils.rm_rf('SearchLink Services')
  end
end

install_searchlink
user = `whoami`.strip
res = `echo #{Shellwords.escape(input)} | automator -i - /Users/#{user}/Library/Services/SearchLink.workflow`.strip

res.gsub!(/'/, "\\\\'")
res.gsub!(/^\(/, '[')
res.gsub!(/\)$/, ']')
res.gsub!(/^  "/, "'")
res.gsub!(/",? *$/, "',")

data = eval(res)

print data.join("\n")
