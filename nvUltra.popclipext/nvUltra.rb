#!/usr/bin/env ruby
# frozen_string_literal: true

require 'erb'

nb = ENV['POPCLIP_OPTION_NVNOTEBOOK']
text = ENV['POPCLIP_TEXT']

notebook = nb && !nb.empty? ? %(&notebook="#{ERB::Util.url_encode(nb)}") : ''

url = "x-nvultra://make/?txt=#{ERB::Util.url_encode(text)}#{notebook}"

`open "#{url}"`
