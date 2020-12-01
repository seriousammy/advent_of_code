require_relative 'lib/day_01/day_01'

puts "Advent of Code Results"
# Day 1 Solution
input_array = File.readlines('lib/day_01/input.txt').map(&:to_i)

day_1 = Day01.new(input: input_array)
part_1 = day_1.twos(target: 2020)
part_2 = day_1.threes(target: 2020)

puts "Day 1 Part 1: #{part_1}"

puts "Day 1 Part 2: #{part_2}"
