require './frequency_accumulator'
require '../input_to_array'

input = InputToArray.new('input.txt')

fa = Day1::FrequencyAccumulator.new(input.input_array)
puts "Day 1 Part 1: #{fa.calculate}"

puts "Day 1 Part 2: #{fa.find_duplicate}"
