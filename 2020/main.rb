# frozen_string_literal: true

require 'benchmark'

require_relative 'lib/day_01/day_01'

puts 'Advent of Code Results'
# Day 1 Solution
input_array = File.readlines('lib/day_01/input.txt').map(&:to_i)

day1 = Day01.new(input: input_array)

part1 = day1.twos(target: 2020)
part2 = day1.threes(target: 2020)

puts "Day 1 Part 1: #{part1}"

puts Benchmark.measure {
  100.times do
    day1.twos(target: 2020)
  end
}

puts "Day 1 Part 2: #{part2}"

puts Benchmark.measure {
  100.times do
    day1.threes(target: 2020)
  end
}
