# frozen_string_literal: true

require 'pry'

test_array = %w(FBFBBFFRLR BFFFBBFRRR FFFBBBFRRR BBFFBBFRLL)

input_array = File.readlines('input.txt').map(&:strip)

def slice_f(array)
  half = (array.length / 2)
  array[0, half]
end

def slice_b(array)
  half = (array.length / 2)
  array[-half, array.length]
end

ids = input_array.map do |input|
  letters = input.chars
  row = (0..127).to_a
  # First 7 letters
  letters[0, 6].each do |letter|
    if letter == 'F'
      row = slice_f(row)
    elsif letter == 'B'
      row = slice_b(row)
    end
  end
  if letters[6] == 'F'
    row = row[0]
  elsif letters[6] == 'B'
    row = row[1]
  end
  # Last 3 letters
  column = (0..7).to_a
  letters[7, 9].each do |letter|
    if letter == 'R'
      column = slice_b(column)
    elsif letter == 'L'
      column = slice_f(column)
    end
  end
  (row * 8) + column.first
end

puts "Day 5 Part 1: #{ids.max}"
puts "Day 5 Part 2: #{(ids.min..ids.max).to_a - ids.sort}"
