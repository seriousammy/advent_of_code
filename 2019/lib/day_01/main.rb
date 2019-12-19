require './fuel_calculator'

input_array = File.readlines('input.txt').map(&:to_i)

# Day 1 Solution

fuel_requirements = input_array.map { |mass| FuelCalculator.new(mass: mass).initial_fuel }
sum_of_fuel_req = fuel_requirements.reduce(:+)

# Day 1 Part 1: 3511949
puts "Day 1 Part 1: #{sum_of_fuel_req}"

# Day 2 Solution

nos_requirements = input_array.map { |mass| FuelCalculator.new(mass: mass).nos_fuel }
sum_of_nos_req = nos_requirements.reduce(:+)

# Day 2 Part 2: 5265045
puts "Day 1 Part 2: #{sum_of_nos_req}"
