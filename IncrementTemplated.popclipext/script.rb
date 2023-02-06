#!/usr/bin/ruby
# frozen_string_literal: true

input = ENV['POPCLIP_TEXT']

NUMERIC_RX = /(\?\:)?##(\d+)(?:\.\.(\d+))?\.\.(\d+)##/.freeze
ARRAY_RX = /##(.*?)##/.freeze

def get_modifiers(input)
  input.scan(%r{##(([ix0-9()+\-/*%]+)*)(#([^#]+))?##}).map do
    m = Regexp.last_match
    padding = if m[2].nil?
                '%d'
              else
                t = m[2].match(/\b(0+)([1-9]\d*)?/)
                t.nil? || m[2] =~ /^0$/ ? '%d' : "%0#{t[0].length}d"
              end

    options_array = m[3].nil? ? nil : m[4].split(/,/).map(&:strip)

    base = m[1].nil? ? 'x' : m[1]
    inc = m[2].nil? ? '' : m[2].gsub(/\b(0+\d+)/, &:to_i)

    [Regexp.escape(m[0]), inc, padding, base, options_array]
  end
end

def process_array(input)
  template = input.match(ARRAY_RX)
  replacements = template[1].split(/,/).map(&:strip)
  modified = get_modifiers(input)
  output = []

  replacements.each_with_index do |replacement, idx|
    out = input.sub(/#{Regexp.escape(template[0])}/, replacement)
    out.gsub!(/##[0x]##/, replacement)
    modified.each do |mod|
      next if mod.nil?

      equat = mod[3].gsub(/\b0+/, '').gsub(/x/, (idx + 1).to_s).gsub(/i/, idx.to_s)
      if mod[4]
        out.sub!(/#{mod[0]}/, mod[4][(mod[2] % (eval equat)).to_i] || '')
      else
        out.sub!(/#{mod[0]}/, (mod[2] % (eval equat).to_s))
      end
    end

    output.push(out)
  end

  output.join("\n")
end

def process_numeric(input)
  template = input.match(NUMERIC_RX)
  disp = template[1].nil? ? true : false
  inc = template[3].nil? ? 1 : template[3].to_i

  modified = get_modifiers(input)

  padding = template[2].match(/^(0+)([1-9](\d+)?)?/)

  padding = if padding.nil? || template[2] =~ /^0$/
              '%d'
            else
              "%0#{padding[0].length}d"
            end

  output = []
  idx = 0
  count_start = template[2].to_i
  count_end = template[4].to_i

  while (count_start <= count_end) do
    replacement = disp ? padding % count_start.to_i : ''
    out = input.sub(/#{Regexp.escape(template[0])}/, replacement)
    modified.each do |mod|
      next if mod.nil?

      equat = mod[3].gsub(/\b0+/, '').gsub(/x/, (idx + 1).to_s).gsub(/i/, idx.to_s)

      if mod[4]
        out.sub!(/#{mod[0]}/, mod[4][(mod[2] % (eval equat)).to_i] || '')
      else
        out.sub!(/#{mod[0]}/, (mod[2] % (eval equat).to_s))
      end
    end
    output << out
    count_start += inc
    idx += 1
  end

  output.join("\n")
end

if input =~ NUMERIC_RX
  input = process_numeric(input)
elsif input =~ ARRAY_RX
  input = process_array(input)
end
print input
