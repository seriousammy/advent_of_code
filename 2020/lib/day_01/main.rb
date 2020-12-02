require './day_01'

input_array = File.readlines('input.txt').map(&:to_i)

# Day 1 Solution

day_1 = Day01.new(input: input_array)
part_1 = day_1.twos(target: 2020)
part_2 = day_1.threes(target: 2020)

puts "Day 1 Part 1: #{part_1}"

puts "Day 1 Part 2: #{part_2}"
