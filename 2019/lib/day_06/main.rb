input_array = File.readlines('input.txt').map {|x| x.strip.split(')')}

root = input_array.flatten.select {|x| input_array.flatten.count(x) == 1}
  .find {|y| input_array.map(&:first).include? y}

# Find distance to root
def dist_to_root(input_array, root, planet)
  direct_orbit = nil
  direct_orbit_name = planet
  orbits = []
  while direct_orbit_name != root do
    direct_orbit = input_array.find{ |x| x.last == direct_orbit_name }
    direct_orbit_name = direct_orbit.first
    orbits << direct_orbit_name
  end
  orbits
end

all_planets = input_array.flatten.uniq
c = []
all_planets.each do |planet|
  c << dist_to_root(input_array, root, planet).count
end

puts "Day 6 Part 1: #{c.reduce(:+)}"

you = dist_to_root(input_array, root, 'YOU')
san = dist_to_root(input_array, root, 'SAN')

you_diff = (you - san).count
san_diff = (san - you).count

puts "Day 6 Part 2: #{you_diff + san_diff}"
