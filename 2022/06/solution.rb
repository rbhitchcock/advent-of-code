#!/usr/bin/env ruby

MARKER = 14

input = STDIN.each_line.to_a.first.chomp.split('')
input.each_with_index do |_, i|
  if input.slice(i, MARKER).uniq.length == MARKER
    puts i + MARKER
    break
  end
end
