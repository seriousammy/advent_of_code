require './intcode'

input_array = File.readlines('input.txt').first.strip.split(',').map(&:to_i)
original_array = input_array.dup

#Replace position as per instruction
input_array[1] = 12
input_array[2] = 2

puts "Day 1 Part 1: #{Intcode.new(num_ary: input_array).call[0]}"

# Part 2
result = 19690720
new_result = 0
noun = nil
verb = nil

# This creates all combination of [(0-99), (0-99)]
(0..99).flat_map { |x| (0..99).map {|y| [x, y] } }.each do |pairing|
  mod_array = original_array.dup
  noun = mod_array[1] = pairing[0]
  verb = mod_array[2] = pairing[1]
  new_result = Intcode.new(num_ary: mod_array).call[0]
  break if new_result == result
end

puts "Day 2 Part 2: #{100 * noun + verb}"
