# frozen_string_literal: true

require 'pry'

passports = []
current_passport = {}

# Convert the input into hashes
File.readlines('input.txt').map(&:strip).each do |line|
  if line == ''
    passports << current_passport
    current_passport = {}
  else
    data = line.split(' ')
    data.each do |d|
      string_data = d.split(':')
      current_passport[string_data[0]] = string_data[1]
    end
  end
end

# Day 1 lets just check if the missing field is empty? or has just 'cid' missing

num_valid_passports = 0
fields = %w[byr iyr eyr hgt hcl ecl pid cid]
valid_passports = []

passports.each do |passport|
  missing_fields = (fields - passport.keys)

  if missing_fields.empty? || missing_fields == ['cid']
    num_valid_passports += 1
    valid_passports << passport
  end
end

puts "Day 4 Part 1: #{num_valid_passports}"

# Day 2 lets check if the passport pass field validation, this was the easiest
# way to grok/do it quickly in my mind.

num_valid_passports_validation = 0

valid_passports.each do |passport|
  next unless passport['byr'].to_i.between?(1920, 2002)
  next unless passport['iyr'].to_i.between?(2010, 2020)
  next unless passport['eyr'].to_i.between?(2020, 2030)

  if passport['hgt'].include? 'cm'
    next unless passport['hgt'].split('cm').first.to_i.between?(150, 193)
  elsif passport['hgt'].include? 'in'
    next unless passport['hgt'].split('in').first.to_i.between?(59, 76)
  else
    next
  end
  next unless /(?<=#)(?<!^)\h{6}/.match(passport['hcl'])
  next unless %w[amb blu brn gry grn hzl oth].include? passport['ecl']
  next unless passport['pid'].chars.length == 9

  num_valid_passports_validation += 1
end

puts "Day 4 Part 2: #{num_valid_passports_validation}"
