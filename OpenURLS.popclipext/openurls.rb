#!/usr/bin/ruby

input = ENV['POPCLIP_TEXT']
# input =<<ENDINPUT
# http://stackoverflow.com/questions/1957156/ckeditor-how-to-add-a-custom-button-to-the-toolbar-that-calls-a-javascript-func
# http://stackoverflow.com/questions/7676144/ckeditor-format-class
# http://ajithmanmadhan.wordpress.com/2009/12/16/customizing-ckeditor-and-adding-a-new-toolbar-button/
# http://www.voofie.com/content/2/ckeditor-plugin-development/
# ENDINPUT

urls = input.scan(/\w+?:[^\n ]+[^\.,!&gt;\)\n ]/)
urls.each {|url| %x{open '#{url}'}}
