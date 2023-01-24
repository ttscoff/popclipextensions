#!/usr/bin/env ruby
require 'shellwords'

input = ENV['POPCLIP_TEXT']

def install_searchlink
  unless File.exist?(File.expand_path('~/Library/Services/SearchLink.workflow'))
    folder = File.expand_path('~/Downloads')
    services = File.expand_path('~/Library/Services')
    dl = File.join(folder, 'SearchLink.zip')
    `curl -SsL -o "#{dl}" https://github.com/ttscoff/searchlink/releases/latest/download/SearchLink.zip`
    Dir.chdir(folder)
    `unzip -qo #{dl} -d #{folder}`
    FileUtils.rm(dl)

    ['SearchLink.workflow', 'SearchLink File.workflow', 'Jump to SearchLink Error.workflow'].each do |wflow|
      src = File.join(folder, 'SearchLink Services', wflow)
      dest = File.join(services, wflow)
      if File.exist?(src) && File.exist?(dest)
        FileUtils.rm_rf(dest)
      end
      FileUtils.mv(src, dest, force: true)
    end
    FileUtils.rm_rf('SearchLink Services')
  end
end

install_searchlink

res = `echo #{Shellwords.escape(input)} | automator -i - ~/Library/Services/SearchLink.workflow`.strip

res.gsub!(/'/, "\\\\'")
res.gsub!(/^\(/, '[')
res.gsub!(/\)$/, ']')
res.gsub!(/^  "/, "'")
res.gsub!(/",? *$/, "',")

data = eval(res)

print data.join("\n")
