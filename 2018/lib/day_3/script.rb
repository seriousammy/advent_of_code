input_array = []
File.readlines('input.txt').each do |line|
  line_parse = line.split(' ')
  claim_id = line_parse.first
  x_y = line_parse[-2].chomp(':').split(',').map(&:to_i)
  w_h = line_parse[-1].split('x').map(&:to_i)
  coords = w_h.first.times.flat_map do |m|
    w_h.last.times.map do |n|
      [claim_id, x_y.first + m, x_y.last + n]
    end
  end
  input_array += coords
end

overlap = input_array.group_by { |x| [x[1], x[2]] }.select { |_, v| v.length > 1 }

puts "Day 3 Part 1 Solution: #{overlap.count}"

list_of_ids = input_array.map {|x| x.first }.uniq
list_of_overlap_ids = overlap.flat_map {|_, v| v.map {|x| x.first} }.uniq

puts "Day 3 Part 2 Solution: #{(list_of_ids - list_of_overlap_ids).first}"
