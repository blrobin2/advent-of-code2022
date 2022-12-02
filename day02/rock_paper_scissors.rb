# frozen_string_literal: true

OPPONENT_ROCK = 'A'
OPPONENT_PAPER = 'B'
OPPONENT_SCISSORS = 'C'

ROCK_SCORE = 1
PAPER_SCORE = 2
SCISSORS_SCORE = 3

LOST_SCORE = 0
DRAW_SCORE = 3
WIN_SCORE = 6

# If these mean what the player should play...
PLAYER_ROCK = 'X'
PLAYER_PAPER = 'Y'
PLAYER_SCISSORS = 'Z'

OUTCOMES = {
  "#{OPPONENT_ROCK} #{PLAYER_ROCK}" => ROCK_SCORE + DRAW_SCORE,
  "#{OPPONENT_ROCK} #{PLAYER_PAPER}" => PAPER_SCORE + WIN_SCORE,
  "#{OPPONENT_ROCK} #{PLAYER_SCISSORS}" => SCISSORS_SCORE + LOST_SCORE,
  "#{OPPONENT_PAPER} #{PLAYER_ROCK}" => ROCK_SCORE + LOST_SCORE,
  "#{OPPONENT_PAPER} #{PLAYER_PAPER}" => PAPER_SCORE + DRAW_SCORE,
  "#{OPPONENT_PAPER} #{PLAYER_SCISSORS}" => SCISSORS_SCORE + WIN_SCORE,
  "#{OPPONENT_SCISSORS} #{PLAYER_ROCK}" => ROCK_SCORE + WIN_SCORE,
  "#{OPPONENT_SCISSORS} #{PLAYER_PAPER}" => PAPER_SCORE + LOST_SCORE,
  "#{OPPONENT_SCISSORS} #{PLAYER_SCISSORS}" => SCISSORS_SCORE + DRAW_SCORE
}.freeze

scores_per_round = 0
File.foreach('input') do |line|
  parsed = line.chomp
  scores_per_round += OUTCOMES[parsed] unless parsed == ''
end

puts scores_per_round

# If these mean what the outcome should be...
LOSE = 'X'
DRAW = 'Y'
WIN = 'Z'

WHAT_TO_PLAY = {
  "#{OPPONENT_ROCK} #{LOSE}" => SCISSORS_SCORE + LOST_SCORE,
  "#{OPPONENT_ROCK} #{WIN}" => PAPER_SCORE + WIN_SCORE,
  "#{OPPONENT_ROCK} #{DRAW}" => ROCK_SCORE + DRAW_SCORE,
  "#{OPPONENT_PAPER} #{LOSE}" => ROCK_SCORE + LOST_SCORE,
  "#{OPPONENT_PAPER} #{WIN}" => SCISSORS_SCORE + WIN_SCORE,
  "#{OPPONENT_PAPER} #{DRAW}" => PAPER_SCORE + DRAW_SCORE,
  "#{OPPONENT_SCISSORS} #{WIN}" => ROCK_SCORE + WIN_SCORE,
  "#{OPPONENT_SCISSORS} #{LOSE}" => PAPER_SCORE + LOST_SCORE,
  "#{OPPONENT_SCISSORS} #{DRAW}" => SCISSORS_SCORE + DRAW_SCORE
}.freeze

scores_per_round = 0
File.foreach('input') do |line|
  parsed = line.chomp
  scores_per_round += WHAT_TO_PLAY[parsed] unless parsed == ''
end

puts scores_per_round
