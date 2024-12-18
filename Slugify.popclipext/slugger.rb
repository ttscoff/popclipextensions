#!/usr/bin/env ruby

clip = ENV['POPCLIP_TEXT']

print clip.downcase
          .gsub(/\./, '-dot-')
          .gsub(/\+/, '-plus-')
          .gsub(/[^a-z0-9 \-.]/i, '')
          .gsub(/\s+/, '-')
          .gsub(/-+/, '-')
          .gsub(/^-/, '')
          .gsub(/(^-|-$)/, '')
