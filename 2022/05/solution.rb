#!/usr/bin/env ruby

class Stack
  def initialize
    @data = []
  end

  def init_push(val)
    @data.append(val)
  end

  def push(val)
    @data.unshift(*val)
  end

  def pop(n = 1)
    @data.slice!(0, n.to_i)
  end

  def peek
    @data[0]
  end
end

lines = STDIN.lines.to_a
stacks = Hash.new do |h, k|
  h[k] = Stack.new
end

lines.each do |line|
  case line.chomp
  when /\[/
    pos = 1
    count = 1
    while pos < line.length
      stacks[count.to_s].init_push(line[pos]) if !line[pos].strip.empty?
      pos += 4
      count += 1
    end
  when /move/
    quantity, source, dest = line.scan(/\d+/)
    # part 1
    #quantity.to_i.times do
    #  stacks[dest].push(stacks[source].pop)
    #end
    stacks[dest].push(stacks[source].pop(quantity))
  end
end

stacks.keys.sort.each do |k|
  print stacks[k].peek
end
puts
