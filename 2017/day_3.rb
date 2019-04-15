# --- Day 3: Spiral Memory ---
# You come across an experimental new kind of memory stored on an infinite
# two-dimensional grid.
#
# Each square on the grid is allocated in a spiral pattern starting at a
# location marked 1 and then counting up while spiraling outward. For example,
# the first few squares are allocated like this:
#
# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23---> ...
# While this is very space-efficient (no squares are skipped), requested data
# must be carried back to square 1 (the location of the only access port for
# this memory system) by programs that can only move up, down, left, or right.
# They always take the shortest path: the Manhattan Distance between the
# location of the data and square 1.
#
# For example:
#
# Data from square 1 is carried 0 steps, since it's at the access port.
# Data from square 12 is carried 3 steps, such as: down, left, left.
# Data from square 23 is carried only 2 steps: up twice.
# Data from square 1024 must be carried 31 steps.
# How many steps are required to carry the data from the square identified in
# your puzzle input all the way to the access port?
#
# Your puzzle input is 325489.
#

input = 325489
# Initialize Variables
square_side = 1
min_steps = 0
max_steps = 0
total_steps = 0
step_range_index = 0

# Set the correct layer
max_layer_num = 0
while max_layer_num <= input do
  # For each "layer" it increase the length of square side by 2 units.
  square_side += 2
  # For each layer increment, the minimum step required to get to the center
  # a.k.a "1" increases by 1, and the maximum step increases by 2.
  min_steps += 1
  max_steps += 2
  # The maximum integer in a given layer is as follows:
  max_layer_num = square_side * square_side
end
# Set the range of steps i.e. for a max 5, min 3, we want an array like:
# [5,4,3,4,3]
space_num = max_layer_num
step_range_trunc = ((min_steps + 1)..(max_steps-1)).to_a
step_range = (min_steps..max_steps).to_a.reverse + step_range_trunc

# Start at the maximum integer in the layer, and traverse backwards until we
# land on the spot eq to our input. Return the step_range as the total_steps.
while space_num > input do
  space_num -= 1
  step_range_index += 1
  if space_num == input
    total_steps = step_range[step_range_index % step_range.length]
  end
end

puts "Day 3, Solution 1: #{total_steps}"

# --- Part Two ---
# As a stress test on the system, the programs here clear the grid and then
# store the value 1 in square 1. Then, in the same allocation order as shown
# above, they store the sum of the values in all adjacent squares, including
# diagonals.
#
# So, the first few squares' values are chosen as follows:
#
# Square 1 starts with the value 1.
# Square 2 has only one adjacent filled square (with value 1), so it also stores
# 1.
# Square 3 has both of the above squares as neighbors and stores the sum of
# their values, 2.
# Square 4 has all three of the aforementioned squares as neighbors and stores
# the sum of their values, 4.
# Square 5 only has the first and fourth squares as neighbors, so it gets the
# value 5.
# Once a square is written, its value does not change. Therefore, the first few
# squares would receive the following values:
#
# 147  142  133  122   59
# 304    5    4    2   57
# 330   10    1    1   54
# 351   11   23   25   26
# 362  747  806--->   ...
# What is the first value written that is larger than your puzzle input?
#

def sum_all_adjacent_squares(x, y, arr_map)
  n = arr_map[x][y+1]
  ne = arr_map[x+1][y+1]
  e = arr_map[x+1][y]
  es = arr_map[x+1][y-1]
  s = arr_map[x][y-1]
  sw = arr_map[x-1][y-1]
  w = arr_map[x-1][y]
  wn = arr_map[x-1][y+1]
  [n, ne, e, es, s, sw, w, wn].sum
end

def generate_move_array(input)
  direction_pattern = ['r','u','l','d']
  move_array = Array.new
  spiral_counter = 1
  input_counter = input
  while input_counter > 1 do
    elem = 0
    input.times do |i|
      2.times do
        break if input_counter < 1
        spiral_counter.times do
          move_array << direction_pattern[elem]
          input_counter -= 1
          break if input_counter < 1
        end
        elem = elem == 3 ? 0 : elem + 1
      end
      spiral_counter += 1
    end
  end
  return move_array
end

# initialize array and vars
MAX_ARRAY = 20
ary_map = Array.new(MAX_ARRAY){Array.new(MAX_ARRAY, 0)}
start_x = MAX_ARRAY/2
start_y = MAX_ARRAY/2
max_num = 1
ary_map[start_x][start_y] = 1

# generate map
move_array = generate_move_array(MAX_ARRAY * MAX_ARRAY)

move_array.each do |val|
  # determine which way to move in array
  case val
  when "r"
    start_x += 1
  when "u"
    start_y += 1
  when "l"
    start_x -= 1
  when "d"
    start_y -=1
  end
  # get value of new spot on array
  current_square_num = sum_all_adjacent_squares(start_x, start_y, ary_map)
  ary_map[start_x][start_y] = current_square_num
  # check if max and if it is over input number
  max_num = current_square_num unless max_num > current_square_num
  break if max_num > input
end

puts "Day 3, Solution 2: #{max_num}"
