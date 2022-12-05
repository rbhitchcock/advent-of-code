#!/usr/bin/env ruby

WIN = 6
DRAW = 3
LOSE = 0

VALUES = {
  "X" => 1, # Rock
  "Y" => 2, # Paper
  "Z" => 3  # Scissors
}

WINNING_PLAYS = {
  "A" => "Y",
  "B" => "Z",
  "C" => "X"
}

DRAWING_PLAYS = {
  "A" => "X",
  "B" => "Y",
  "C" => "Z"
}

LOSING_PLAYS = {
  "A" => "Z",
  "B" => "X",
  "C" => "Y"
}

if $PROGRAM_NAME == __FILE__
  sum = 0
  plays = STDIN.each_line do |line|
    opp, resp = line.split(' ')
    if resp == "X" # win
      sum = sum + VALUES[LOSING_PLAYS[opp]] + LOSE
    elsif resp == "Y" # draw
      sum = sum + VALUES[DRAWING_PLAYS[opp]] + DRAW
    elsif resp == "Z" # lose
      sum = sum + VALUES[WINNING_PLAYS[opp]] + WIN
    end
  end

  p sum
end
