# frozen_string_literal: true

# Day 2 Problem
class Day02
  def initialize(input:)
    @input = input
  end

  def part1
    @input.sum { |i| p1_verify(i) }
  end

  def part2
    @input.sum { |i| p2_verify(i) }
  end

  private

  def p1_verify(line)
    arr = line.split(' ')
    range1 = arr.first.split('-').first.to_i
    range2 = arr.first.split('-').last.to_i
    letter = arr[1].chars.first
    num_of_letter_in_pw = arr.last.count(letter)
    return 1 if (range1..range2).cover? num_of_letter_in_pw

    0
  end

  def p2_verify(line)
    arr = line.split(' ')
    range1 = arr.first.split('-').first.to_i - 1
    range2 = arr.first.split('-').last.to_i - 1
    letter = arr[1].chars.first
    pw = arr.last.chars

    return 0 if pw[range1] == letter && pw[range2] == letter
    return 1 if (pw[range1] == letter && pw[range2] != letter) ||
                (pw[range2] == letter && pw[range1] != letter)

    0
  end
end
