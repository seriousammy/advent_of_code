input_array = []

File.readlines('test2.txt').each_with_index do |line, y|
  line.strip.chars.each_with_index do |value, x|
    input_array << [x, y] if value == '#'
  end
end

def gcd_steps(steps)
  gcd = steps[0].gcd(steps[1])
  if gcd != 0
    [[(steps[0] / gcd), (steps[1] / gcd)], steps]
  else
    [steps, steps]
  end
end

asteroids = input_array.map do |station|
  view_count = input_array.map do |asteroid|
    x_steps = (asteroid[0] - station[0])
    y_steps = (asteroid[1] - station[1])
    gcd_steps([x_steps, y_steps])[0]
  end.reject { |coords| coords == [0, 0] }.uniq.count
  [station, view_count]
end

max_asteroid_view = asteroids.max_by { |i| i[1] }

puts "Day 10 Part 1: #{max_asteroid_view[1]}"
