input_array = []

File.readlines('input.txt').each do |line|
  input_array << line.strip
end

# Sort input by datetime
sorted_array = input_array.sort_by do |line|
  line.split(' ').take(2).join(' ')
end

# Create a guard log with all mins belonging to a guard in a hash
guard_log = {}
guard_id = nil
while sorted_array.length > 0 do
  line = sorted_array.shift
  line_parsed = line.split(' ')
  minute = line_parsed[1].chomp(']').split(':').last.to_i
  if line_parsed.last == 'shift'
    guard_id = line_parsed[3].split('#').last.to_i
    guard_log[guard_id] = [] unless guard_log[guard_id]
  elsif line_parsed.last == 'asleep'
    guard_log[guard_id] << minute
  elsif line_parsed.last == 'up'
    guard_log[guard_id] << minute
  end
end

# Pair each guard's minute log
guard_log.each do |key, value|
  guard_log[key] = value.each_slice(2).to_a
end

# Hydrate each minute pairing to include all minutes
guard_log.each do |key, value|
  guard_log[key] = value.flat_map do |minute_pair|
    minute_asleep = minute_pair[0]
    minute_awake = minute_pair[1]
    if minute_asleep > minute_awake
      minute_awake += 60
    end
    (minute_asleep..minute_awake).to_a.map { |m| m % 60 }
  end
end

# Find the guard with the max minutes slept
max_sleep_guard = []
max_sleep_guard_id = ''
guard_log.each do |key, value|
  if value.length > max_sleep_guard.length
    max_sleep_guard = value
    max_sleep_guard_id = key
  end
end

# Find the guard with the most reoccuring minute slept

max_occurence_guard_id = ''
max_minute_occurence = 0
max_minute_occurence_count = 0
guard_log.each do |key, value|
  most_minute_occurence = value.max_by { |x| value.count(x) }
  most_minute_occurence_count = value.count(most_minute_occurence)
  if max_minute_occurence_count < most_minute_occurence_count
    max_minute_occurence = most_minute_occurence
    max_minute_occurence_count = most_minute_occurence_count
    max_occurence_guard_id = key
  end
end
most_slept_min = max_sleep_guard.max_by { |i| max_sleep_guard.count(i) }
most_slept_guard_id = max_sleep_guard_id

puts "Day 4 Part 1: #{most_slept_min * most_slept_guard_id}"

puts "Day 4 Part 2: #{max_occurence_guard_id * max_minute_occurence}"
