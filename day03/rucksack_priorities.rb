# frozen_string_literal: true

def to_i26(char)
  together = ('a'..'z').to_a.concat(('A'..'Z').to_a)
  together.index(char) + 1
end

# Unique for each line split in half
shared_items = []
File.foreach('input') do |line|
  parsed = line.chomp
  _, first_half, second_half = parsed.partition(/.{#{parsed.size / 2}}/)
  shared = first_half.split('') & second_half.split('')
  shared_items.push(*shared)
end

puts shared_items.map { |char| to_i26(char) }.sum

# Unique for every 3 lines
shared_items = []
File.foreach('input').each_slice(3) do |line_group|
  line1, line2, line3 = line_group.map(&:chomp).flatten
  shared = line1.split('') & line2.split('') & line3.split('')
  shared_items.push(*shared)
end

puts shared_items.map { |char| to_i26(char) }.sum
