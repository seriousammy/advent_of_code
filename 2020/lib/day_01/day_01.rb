# frozen_string_literal: true

# Day 1 Problem
class Day01
  def initialize(input:)
    @input = input
  end

  def twos(target:)
    h = {}
    @input.each_with_index do |value, index|
      target_pair_number = target - value
      return target_pair_number * value if h[target_pair_number]

      h[value] = index
    end
  end

  def threes(target:)
    h = {}
    nums = []
    @input.each_with_index do |value, index|
      target_pair_number = target - value
      if (pair = pair(nums: nums, target: target_pair_number))
        return (pair.append(value)).inject(1, :*)
      end

      nums << value
      h[value] = index
    end
  end

  private

  def pair(nums:, target:)
    h = {}

    nums.each_with_index do |value, index|
      target_pair_number = target - value
      return [target_pair_number, value] if h[target_pair_number]

      h[value] = index
    end
    nil
  end
end
