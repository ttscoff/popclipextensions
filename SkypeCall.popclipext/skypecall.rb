#!/usr/bin/ruby

input = ENV['POPCLIP_TEXT']
# input = "This is a phone number 8075555486 and this 1 (807) 555-5487 and this 555-5488"

phone_numbers = input.scan(/(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?/)
%x{/usr/bin/osascript -e 'set _cmd to "CALL #{phone_numbers[0].join("")}"' -e 'tell application "Skype" to send command _cmd script name "PCDIALER"'}
