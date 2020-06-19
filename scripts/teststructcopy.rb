#!/usr/bin/ruby
# coding: utf-8

require 'find'
require 'fileutils'

source, dest = ARGV

IGNORE = ['.app', '.scptd', '.rtfd', '.pages']

Find.find(source) do |item|
   next if !File.directory?(item) || item == source
   Find.prune if IGNORE.include?(File.extname(item))
   FileUtils.mkdir_p(dest + item.gsub(source, ''))
end

puts $?.success?
