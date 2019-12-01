require '../input_to_array'

input = InputToArray.new('input.txt')
input_array = input.input_array

# Part 1
part_1 = input_array.inject(&:+)
puts "Day 1 Part 1: #{part_1}"

# Day 1 Part 1: 576
# ruby script.rb  0.06s user 0.01s system 97% cpu 0.081 total

# Part 2
freq_history = []
accumulator = 0
matched = false
loop do
  input_array.each do |num|
    accumulator += num
    if freq_history.include? accumulator
      matched = true
      break
    else
      freq_history << accumulator
    end
  end
  break if matched
end

puts "Day 2 Part 2: #{accumulator}"

# Day 2 Part 2: 77674
# ruby script.rb  43.03s user 0.06s system 99% cpu 43.120 total
