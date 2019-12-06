require './intcode_mod'

input_array = File.readlines('input.txt').first.strip.split(',').map(&:to_i)
input_array_2 = input_array.dup

part_1 = IntcodeMod.new(num_ary: input_array, input_code: 1)
part_1.call

puts "Day 1 Part 1: #{part_1.diag_code}"

x = IntcodeMod.new(num_ary: input_array_2, input_code: 5)
x.call

puts "Day 1 Part 2: #{x.diag_code}"
