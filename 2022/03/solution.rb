#!/usr/bin/env ruby

PRIORITY = (('a'..'z').to_a + ('A'..'Z').to_a).each_with_index.reduce(Hash.new(1)) do |memo, (char, index)|
  memo[char] += index
  memo
end

def find_match_val(s1, s2)
  s1.each_char do |c|
    if %r{[#{c}]} =~ s2
      return PRIORITY[c]
    end
  end
  0
end

if $PROGRAM_NAME == __FILE__
  sum = 0
  sacks = []
  plays = STDIN.each_line do |line|
    sacks << line.chomp.split('').uniq.join
  end

  while !sacks.empty?
    sacks.shift(3).join.each_char.reduce(Hash.new(0)) do |memo, char|
      if memo[char] == 2
        sum += PRIORITY[char]
        break
      else
        memo[char] += 1
      end
      memo
    end
  end

  p sum
end
