# frozen_string_literal: true

answers = []

current_group = []

input = File.readlines('input.txt').map(&:strip)

input.map(&:strip).each do |line|
  if line == ''
    answers << current_group
    current_group = []
  else
    data = line.chars
    current_group << data
  end
end

# Last input doesn't get grouped in from input, so lets do it now.
answers << current_group
puts "Day 6 Part 1: #{answers.map(&:flatten).map(&:uniq).sum(&:length)}"

# Part 2
answers = []
current_group = []
group_size = 0

input.each_with_index do |line, index|
  if line == '' || index == (input.length - 1)
    answers << current_group.select { |x| current_group.count(x) == group_size }
    current_group = []
    group_size = 0
  else
    data = line.chars
    current_group += data
    group_size += 1
  end
end
answers << current_group

puts "Day 6 Part 2: #{answers.map(&:uniq).sum(&:length)}"
