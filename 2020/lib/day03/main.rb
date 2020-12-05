# frozen_string_literal: true

input_array = File.readlines('input.txt').map(&:strip)

# Lets create a map
map = []

input_array.each_with_index do |row, index|
  row_array = row.chars
  extended_row = []
  index.times { extended_row += row_array }
  map << extended_row
end

def traverse_downhill(map, right, down)
  right_position = right
  tree_count = 0
  current_index = 0
  map.each_with_index do |_row, index|
    next unless current_index == index
    next if (index + down) >= map.length

    tree_count += 1 if map[index + down][right_position] == '#'
    right_position += right
    current_index += down
  end
  tree_count
end

puts "Day 3 Part 1: #{traverse_downhill(map, 3, 1)}"

results = []
[[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]].each do |right, down|
  results << traverse_downhill(map, right, down)
end

puts "Day 3 Part 2: #{results.inject(1, :*)}"
