require './password_validator'

input_range = (128392..643281)

part_1 = input_range.select { |pw| PasswordValidator.new(password:pw).valid? }.count

part_2 = input_range.select { |pw| PasswordValidator.new(password:pw).part_2_valid? }.count

puts "Day 4 Part 1: #{part_1}"

puts "Day 4 Part 2: #{part_2}"
