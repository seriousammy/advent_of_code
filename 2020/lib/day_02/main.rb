# frozen_string_literal: true

require './day_02'
input_array = File.readlines('input.txt').map(&:strip)

# Day 2 Solution

day2 = Day02.new(input: input_array)
puts "Day 2 Part 1: #{day2.part1}"
puts "Day 2 Part 2: #{day2.part2}"
