# frozen_string_literal: true

require 'set'

file_data = File.read('input').split('')
num_letters = 0
NUM_DISTINCT = 14
loop do
  letters = file_data.first(NUM_DISTINCT)
  if letters.to_set.size == letters.size
    puts NUM_DISTINCT + num_letters
    break
  end

  file_data.shift
  num_letters += 1
end
