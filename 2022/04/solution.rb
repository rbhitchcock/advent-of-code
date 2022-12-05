#!/usr/bin/env ruby

require 'set'

if $PROGRAM_NAME == __FILE__
  totalMatch = []
  altMatch = []
  total = 0
  alt = 0
  overlapTotal = 0
  plays = STDIN.each_line do |line|
    left, right = line.chomp.split(',').map { |side| side.split('-') }
    leftSet = Set.new(left[0]..left[1])
    rightSet = Set.new(right[0]..right[1])

    if leftSet <= rightSet || rightSet <= leftSet
      total += 1
    else
      puts "DEBUG: not a match: #{leftSet}, #{rightSet}"
    end

    if !(leftSet.disjoint?(rightSet))
      overlapTotal += 1
    end

    #if right[0] >= left[0] && right[1] <= left[1]
    #  total += 1
    #elsif left[0] >= right[0] && left[1] <= right[1]
    #  total += 1
    #end
  end
  puts "TOTAL: #{total}"
  puts "ALT: #{alt}"
  puts "Overlap: #{overlapTotal}"
end
