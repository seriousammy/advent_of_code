require './frequency_accumulator'
require '../input_to_array'

input = InputToArray.new('input.txt')

input_array = input.input_array
part_1 = input_array.inject(&:+)
puts part_1

# Using classes
fa = Day1::FrequencyAccumulator.new(input.input_array)
puts "Day 1 Part 1: #{fa.calculate}"

#puts "Day 1 Part 2: #{fa.find_duplicate}"
