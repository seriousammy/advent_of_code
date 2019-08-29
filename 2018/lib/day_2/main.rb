require './checksum'
require '../input_to_array'

input = InputToArray.new('input.txt').translate_file_input_to_array(:to_s)

cs = Day2::CheckSum.new(input.map(&:strip))

puts "Day 2 Part 1: #{cs.checksum}"
puts "Day 2 Part 2: #{cs.differ_by_one_char_word}"
