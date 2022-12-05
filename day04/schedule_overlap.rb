# frozen_string_literal: true

schedules_that_are_contained = 0
schedules_that_overlap = 0
File.foreach('input') do |line|
  schedule1, schedule2 = line.chomp.split(',')
  schedule1_start, schedule1_end = schedule1.split('-').map(&:to_i)
  schedule2_start, schedule2_end = schedule2.split('-').map(&:to_i)

  schedule1_nums = (schedule1_start..schedule1_end).to_a
  schedule2_nums = (schedule2_start..schedule2_end).to_a

  if schedule1_nums & schedule2_nums == schedule1_nums || schedule1_nums & schedule2_nums == schedule2_nums
    schedules_that_are_contained += 1
  end

  schedules_that_overlap += 1 if (schedule1_nums & schedule2_nums).size.positive?
end

puts schedules_that_are_contained
puts schedules_that_overlap
