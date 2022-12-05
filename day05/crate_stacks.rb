# frozen_string_literal: true

read_stack = false
rows = []
File.foreach('input') do |line|
  if line.chomp == ''
    rows = rows.transpose.map do |row|
      row.pop
      row.reverse.reject(&:nil?)
    end

    read_stack = true
    next
  end

  if read_stack
    num_to_move, from_stack_i, to_stack_i = line.split(' ').select { |piece| piece =~ /\A\d+\Z/ }.map(&:to_i)

    from_stack = rows[from_stack_i - 1]
    to_stack = rows[to_stack_i - 1]

    # moves crate one at a time
    # while num_to_move.positive?
    #  to_move = from_stack.pop
    #  to_stack << to_move
    #  num_to_move -= 1
    # end

    # moves crates all at once, keeping order
    to_move = from_stack.pop(num_to_move)
    to_stack.push(*to_move)
  else
    row = line.chomp.split('').each_slice(4).to_a.map do |arr|
      letter = arr[1]
      next nil if letter == ' '

      letter
    end

    rows << row
  end
end

# puts rows.inspect
puts rows.map(&:pop).join('')
