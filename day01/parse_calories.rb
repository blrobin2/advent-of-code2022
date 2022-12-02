# frozen_string_literal: true

elves = []
elf = []
File.foreach('input') do |line|
  num = line.chomp.to_i
  if num.zero?
    elves << elf.sum
    elf = []
  else
    elf << num
  end
end

max = elves.max
puts "Max Calories: #{max}"

top_three_total = elves.max(3).sum
puts "Top Three Total Calories: #{top_three_total}"
