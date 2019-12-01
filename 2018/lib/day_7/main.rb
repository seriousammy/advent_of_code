input_array = []

# Read and Parse input as
# [Prerequsite, Step to Take]
File.readlines('input.txt').each do |line|
  line_split = line.split
  input_array << [line_split[1], line_split[-3]]
end

order_steps = []
prereq_hash = {}
list_of_all_steps = input_array.flatten.uniq.sort
list_of_all_steps.each { |step| prereq_hash[step] = input_array.select { |branch| branch.last == step }.map(&:first) }

while prereq_hash.length > 0
  # Get hash of available branch to use
  available_steps = prereq_hash.select { |_, prereq_array| prereq_array.empty? }
  next_step = available_steps.sort_by {|key, _| key}.first
  next_step_key = next_step.first
  order_steps << next_step_key
  # Delete added step from keys
  prereq_hash.delete(next_step_key)
  # Update prereq_hash
  prereq_hash.each { |key, value| value.delete(next_step_key) }
end

puts "Day 6 Part 1: #{order_steps.join('')}"
puts order_steps.join('') == 'GKPTSLUXBIJMNCADFOVHEWYQRZ'
