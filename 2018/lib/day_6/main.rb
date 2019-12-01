input_array = []

File.readlines('input.txt').each do |line|
  input_array << line.strip.split(',').map(&:to_i)
end

max_x = input_array.max_by {|coord| coord.first }.first
max_y = input_array.max_by {|coord| coord.last }.last

map = Array.new(max_y * max_x)

map = (0..max_x).flat_map do |x|
  (0..max_y).map do |y|
    [x, y]
  end
end
man_map = []
inf_coord = []
map.each do |map_coord|
  two_min = input_array.min_by(2) do |input_coord|
    (map_coord.first - input_coord.first).abs + (map_coord.last - input_coord.last).abs
  end
  first_coord_dist = (map_coord.first - two_min.first.first).abs + (map_coord.last - two_min.first.last).abs
  second_coord_dist = (map_coord.first - two_min.last.first).abs + (map_coord.last - two_min.last.last).abs
  if second_coord_dist == first_coord_dist
    man_map << nil
  else
    if ([0, max_x].include? map_coord.first) || ([0, max_y].include? map_coord.last)
      inf_coord << two_min.first
    end

    man_map << two_min.first
  end
end
valid_map = man_map.reject {|x| inf_coord.uniq.include? x || x.nil? }
max_occuring_coord = valid_map.max_by {|x| valid_map.count(x)}
puts "Day 6 Part 1: #{valid_map.count(max_occuring_coord)}"
# ruby main.rb  576.81s user 1.51s system 1% cpu 15:40:22.56 total

# PART 2
region_count = 0
map.each do |map_coord|
  total_distance = input_array.map do |input_coord|
    (map_coord.first - input_coord.first).abs + (map_coord.last - input_coord.last).abs
  end.inject(:+)
  if total_distance < 10000
    region_count += 1
  end
end

puts "Day 6 Part 2: #{region_count}"

# ruby main.rb  1.08s user 0.02s system 99% cpu 1.104 total
