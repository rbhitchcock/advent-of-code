#!/usr/bin/env ruby

class Elf
  def snacks
    @snacks ||= []
  end

  def add_snack(calories)
    snacks << Snack.new(calories)
  end

  def total_calories_carried
    snacks.reduce(0) { |sum, snack| sum += snack.calories }
  end
end

class Snack
  attr_reader :calories

  def initialize(calories)
    @calories = calories
  end
end

def max_carried(elves)
  max_elf = elves.max_by { |elf| elf.total_calories_carried }
  puts "Maximum: #{max_elf.total_calories_carried}"
end

def top_n(elves, n = 3)
  elves.sort_by { |elf| -elf.total_calories_carried }.take(n).reduce(0) { |sum, elf| sum += elf.total_calories_carried }
end

if $PROGRAM_NAME == __FILE__
  cur_elf = Elf.new
  elves = []
  STDIN.each_line do |line|
    if line.chomp == ""
      elves << cur_elf
      cur_elf = Elf.new
    else
      cur_elf.add_snack(line.chomp.to_i)
    end
  end
  elves << cur_elf

  max_carried(elves)
  puts "Top 3: #{top_n(elves, 3)}"
end
