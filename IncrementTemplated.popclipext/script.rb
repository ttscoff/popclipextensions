#!/usr/bin/ruby
# frozen_string_literal: true

input = ENV['POPCLIP_TEXT']

NUMERIC_RX = /(\?\:)?##(\d+)\.\.(\d+)##/.freeze
ARRAY_RX = /##(.*?)##/.freeze

def process_array(input)
  template = input.match(ARRAY_RX)
  replacements = template[1].split(/,/).map(&:strip)
  output = []

  replacements.each do |replacement|
    out = input.sub(/#{Regexp.escape(template[0])}/, replacement)
    out.gsub!(/##0##/, replacement)
    output.push(out)
  end

  output.join("\n")
end

def get_modifiers(input)
  input.scan(/(##([+\-])?(\d+)##)/).map do |x|
    padding = x[2].match(/^(0+)([1-9](\d+)?)?/)
    padding = padding.nil? || x[2] =~ /^0$/ ? '%d' : "%0#{padding[0].length}d"

    inc = x[1] =~ /\+/ || x[1].nil? ? x[2].to_i : x[2].to_i * -1

    [Regexp.escape(x[0]), inc, padding]
  end
end

def process_numeric(input)
  template = input.match(NUMERIC_RX)
  disp = template[1].nil? ? true : false

  modified = get_modifiers(input)

  padding = template[2].match(/^(0+)([1-9](\d+)?)?/)

  padding = if padding.nil? || template[2] =~ /^0$/
              '%d'
            else
              "%0#{padding[0].length}d"
            end

  output = []
  count_start = template[2].to_i
  count_end = template[3].to_i
  duration = (count_end - count_start) + 1
  duration.times do
    replacement = disp ? padding % count_start.to_i : ''
    out = input.sub(/#{Regexp.escape(template[0])}/, replacement)
    modified.each { |mod| out.sub!(/#{mod[0]}/, (mod[2] % (count_start.to_i + mod[1].to_i)).to_s) }
    output << out
    count_start += 1
  end

  output.join("\n")
end

if input =~ NUMERIC_RX
  input = process_numeric(input)
elsif input =~ ARRAY_RX
  input = process_array(input)
end
print input
