require './untangle'

input_array = File.readlines('input.txt')

line1 = input_array[0].strip.split(',')
line2 = input_array[1].strip.split(',')
#line1 = 'R75,D30,R83,U83,L12,D49,R71,U7,L72'.split(',')
#line2 = 'U62,R66,U55,R34,D71,R55,D58,R83'.split(',')
coords1 = Untangle.new(path: line1).call
coords2 = Untangle.new(path: line2).call

set_map = coords1.uniq & coords2.uniq

shortest_dist = set_map.map do |coord|
  # Man Dist Formula
  (coord[0] - 0).abs + (coord[1] - 0).abs
end.min

puts "Day 3 Part 1: #{shortest_dist}"

# Part 2
# Note we need to add 2, as [0, 0] is not added into coord from Untangle class.
shortest_steps = set_map.map {|coord| 2 + coords1.index(coord) + coords2.index(coord)}.min

puts "Day 3 Part 2: #{shortest_steps}"
