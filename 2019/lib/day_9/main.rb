require './intcode_mod_boost'

input_array = File.readlines('input.txt').first.strip.split(',').map(&:to_i)

part1 = IntcodeModBoost.new(num_ary: input_array.dup, input_codes: [1])
part1.call

puts "Day 9 Part 1: #{part1.diag_code}"

part2 = IntcodeModBoost.new(num_ary: input_array.dup, input_codes: [2])
part2.call

puts "Day 9 Part 2: #{part2.diag_code}"

