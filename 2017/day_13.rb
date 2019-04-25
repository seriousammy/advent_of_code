# --- Day 13: Packet Scanners ---
# You need to cross a vast firewall. The firewall consists of several layers,
# each with a security scanner that moves back and forth across the layer. To
# succeed, you must not be detected by a scanner.
#
# By studying the firewall briefly, you are able to record (in your puzzle
# input) the depth of each layer and the range of the scanning area for the
# scanner within it, written as depth: range. Each layer has a thickness of
# exactly 1. A layer at depth 0 begins immediately inside the firewall; a layer
# at depth 1 would start immediately after that.
#
# For example, suppose you've recorded the following:
#
# 0: 3
# 1: 2
# 4: 4
# 6: 4
# This means that there is a layer immediately inside the firewall (with range
# 3), a second layer immediately after that (with range 2), a third layer which
# begins at depth 4 (with range 4), and a fourth layer which begins at depth 6
# (also with range 4). Visually, it might look like this:
#
#  0   1   2   3   4   5   6
#  [ ] [ ] ... ... [ ] ... [ ]
#  [ ] [ ]         [ ]     [ ]
#  [ ]             [ ]     [ ]
#                  [ ]     [ ]
#Within each layer, a security scanner moves back and forth within its range.
#Each security scanner starts at the top and moves down until it reaches the
#bottom, then moves up until it reaches the top, and repeats. A security scanner
#takes one picosecond to move one step. Drawing scanners as S, the first few
#picoseconds look like this:
#
#
#Picosecond 0:
# 0   1   2   3   4   5   6
# [S] [S] ... ... [S] ... [S]
# [ ] [ ]         [ ]     [ ]
# [ ]             [ ]     [ ]
#                 [ ]     [ ]
#Picosecond 1:
# 0   1   2   3   4   5   6
# [ ] [ ] ... ... [ ] ... [ ]
# [S] [S]         [S]     [S]
# [ ]             [ ]     [ ]
#                 [ ]     [ ]
#
#Picosecond 2:
# 0   1   2   3   4   5   6
# [ ] [S] ... ... [ ] ... [ ]
# [ ] [ ]         [ ]     [ ]
# [S]             [S]     [S]
#                 [ ]     [ ]
#
#Picosecond 3:
# 0   1   2   3   4   5   6
# [ ] [ ] ... ... [ ] ... [ ]
# [S] [S]         [ ]     [ ]
# [ ]             [ ]     [ ]
#                 [S]     [S]
#
#Your plan is to hitch a ride on a packet about to move through the firewall.
#The packet will travel along the top of each layer, and it moves at one layer
#per picosecond. Each picosecond, the packet moves one layer forward (its first
#move takes it into layer 0), and then the scanners move one step. If there is a
#scanner at the top of the layer as your packet enters it, you are caught. (If a
#scanner moves into the top of its layer while you are there, you are not
#caught: it doesn't have time to notice you before you leave.) If you were to do
#this in the configuration above, marking your current position with
#parentheses, your passage through the firewall would look like this:
# Initial state:
#  0   1   2   3   4   5   6
#  [S] [S] ... ... [S] ... [S]
#  [ ] [ ]         [ ]     [ ]
#  [ ]             [ ]     [ ]
#                  [ ]     [ ]
#
#  Picosecond 0:
#   0   1   2   3   4   5   6
#   (S) [S] ... ... [S] ... [S]
#   [ ] [ ]         [ ]     [ ]
#   [ ]             [ ]     [ ]
#                   [ ]     [ ]
#
#   0   1   2   3   4   5   6
#   ( ) [ ] ... ... [ ] ... [ ]
#   [S] [S]         [S]     [S]
#   [ ]             [ ]     [ ]
#                   [ ]     [ ]
#
#
#  Picosecond 1:
#   0   1   2   3   4   5   6
#   [ ] ( ) ... ... [ ] ... [ ]
#   [S] [S]         [S]     [S]
#   [ ]             [ ]     [ ]
#                   [ ]     [ ]
#
#   0   1   2   3   4   5   6
#   [ ] (S) ... ... [ ] ... [ ]
#   [ ] [ ]         [ ]     [ ]
#   [S]             [S]     [S]
#                   [ ]     [ ]
#
#
# Picosecond 2:
#  0   1   2   3   4   5   6
#  [ ] [S] (.) ... [ ] ... [ ]
#  [ ] [ ]         [ ]     [ ]
#  [S]             [S]     [S]
#                  [ ]     [ ]
#
#  0   1   2   3   4   5   6
#  [ ] [ ] (.) ... [ ] ... [ ]
#  [S] [S]         [ ]     [ ]
#  [ ]             [ ]     [ ]
#                  [S]     [S]
#
#
#  Picosecond 3:
#   0   1   2   3   4   5   6
#   [ ] [ ] ... (.) [ ] ... [ ]
#   [S] [S]         [ ]     [ ]
#   [ ]             [ ]     [ ]
#                   [S]     [S]
#
#   0   1   2   3   4   5   6
#   [S] [S] ... (.) [ ] ... [ ]
#   [ ] [ ]         [ ]     [ ]
#   [ ]             [S]     [S]
#                   [ ]     [ ]
#
#
#  Picosecond 4:
#   0   1   2   3   4   5   6
#   [S] [S] ... ... ( ) ... [ ]
#   [ ] [ ]         [ ]     [ ]
#   [ ]             [S]     [S]
#                   [ ]     [ ]
#
#   0   1   2   3   4   5   6
#   [ ] [ ] ... ... ( ) ... [ ]
#   [S] [S]         [S]     [S]
#   [ ]             [ ]     [ ]
#                   [ ]     [ ]
#
#
#  Picosecond 5:
#   0   1   2   3   4   5   6
#   [ ] [ ] ... ... [ ] (.) [ ]
#   [S] [S]         [S]     [S]
#   [ ]             [ ]     [ ]
#                   [ ]     [ ]
#
#   0   1   2   3   4   5   6
#   [ ] [S] ... ... [S] (.) [S]
#   [ ] [ ]         [ ]     [ ]
#   [S]             [ ]     [ ]
#                   [ ]     [ ]
#
#
#  Picosecond 6:
#   0   1   2   3   4   5   6
#   [ ] [S] ... ... [S] ... (S)
#   [ ] [ ]         [ ]     [ ]
#   [S]             [ ]     [ ]
#                   [ ]     [ ]
#
#   0   1   2   3   4   5   6
#   [ ] [ ] ... ... [ ] ... ( )
#   [S] [S]         [S]     [S]
#   [ ]             [ ]     [ ]
#                   [ ]     [ ]
# In this situation, you are caught in layers 0 and 6, because your packet
# entered the layer when its scanner was at the top when you entered it. You are
# not caught in layer 1, since the scanner moved into the top of the layer once
# you were already there.
#
# The severity of getting caught on a layer is equal to its depth multiplied by
# its range. (Ignore layers in which you do not get caught.) The severity of the
# whole trip is the sum of these values. In the example above, the trip severity
# is 0*3 + 6*4 = 24.
#
# Given the details of the firewall you've recorded, if you leave immediately,
# what is the severity of your whole trip?

def setup_layer_map(input_ary)
  map_array = Array.new
  input_ary.each do |ary|
    map_array[ary[0]] = ary[1]
  end
  return map_array
end

def move_sweeper(security_sweeper)
  if security_sweeper.direction == "i"
    if security_sweeper.depth == security_sweeper.position
      security_sweeper.direction = "d"
      security_sweeper.position -= 1
    else
      security_sweeper.position += 1
    end
  elsif security_sweeper.direction == "d"
    if security_sweeper.position == 1
      security_sweeper.direction = "i"
      security_sweeper.position += 1
    else
      security_sweeper.position -= 1
    end
  end
end

input_array = Array.new
file_name = "day_13_input.txt"

File.readlines(file_name).each do |line|
  input_array << line.split(": ").map {|x| x.to_i}
end
# Setup Map
map_array = setup_layer_map(input_array)
# Struct for sweeper
SecuritySweeper = Struct.new(:depth, :position, :direction)
# Initialize map with sweepers
map_with_sweeper_array = Array.new
map_array.each_with_index do |elem, index|
  if elem
    map_with_sweeper_array[index] =  SecuritySweeper.new(elem, 1, "i")
  end
end

security_sum = 0
# Steps
map_array.length.times do |x|
  # Move
  current_security = map_with_sweeper_array[x]
  if current_security && current_security.position == 1
    security_sum += x * map_with_sweeper_array[x].depth
  end
  # Security Step
  map_with_sweeper_array.each do |elem|
    move_sweeper(elem) if elem
  end
end

puts "Day 13 Solution 1: #{security_sum}"
