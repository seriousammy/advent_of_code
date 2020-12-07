# frozen_string_literal: true

input = File.readlines('input.txt').map(&:strip)

# Part 1

parent_bags = []

tree_size = 0
current_tree_size = 1

# Find all the possible "parent" bags (Bags that will lead to a shiny gold)
while tree_size != current_tree_size
  tree_size = parent_bags.length
  input.each do |line|
    bag_contains = line.split('bags contain').first.strip
    bag_containees = line.split('bags contain ')[1].split(', ')
    bag_containees.each do |bag|
      bag_color = [bag.split(' ')[1], bag.split(' ')[2]].join(' ')
      if bag_color == 'shiny gold'
        parent_bags << bag_contains
      elsif parent_bags.include? bag_color
        parent_bags << bag_contains
      end
    end
  end
  parent_bags = parent_bags.uniq
  current_tree_size = parent_bags.length
end

puts "Day 7 Part 1: #{parent_bags.count}"

# Part 2

# Lets store all the bags into a hash for quick lookups.
bag_hash = {}
input.each do |line|
  bag_contains = line.split('bags contain').first.strip
  bag_containees_data = []
  bag_containees = line.split('bags contain ')[1].split(', ')
  bag_containees.each do |bag|
    bag_num = bag.split(' ').first
    bag_color = [bag.split(' ')[1], bag.split(' ')[2]].join(' ')
    bag_containees_data << [bag_num, bag_color]
  end
  bag_hash[bag_contains] = bag_containees_data
end

current_bags = ['shiny gold']
current_bags.each do |bag|
  bag_hash[bag].each do |b|
    next if b[0] == 'no'

    b[0].to_i.times do
      current_bags << b[1]
    end
  end
end

puts "Day 7 Part 2: #{(current_bags.count - 1)}"
