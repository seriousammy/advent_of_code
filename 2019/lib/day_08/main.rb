input_array = File.readlines('input.txt').first.strip.chars

width = 25
height = 6
fewest_zero = input_array.each_slice(width * height).to_a.min_by { |x| x.count('0') }

puts "Day 8 Part 1: #{fewest_zero.count('1') * fewest_zero.count('2')}"

image = Array.new(width * height)

input_array.each_slice(width * height) do |layer|
  layer.each_with_index do |v, i|
    if v != "2" && image[i] == nil
      image[i] = v
    end
  end
end

puts "Day 8 Part 2: (read the ones and squint)"
image.each_slice(width) do |line|
  puts line.map(&:to_i).inspect
end
