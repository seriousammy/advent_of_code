# --- Day 4: High-Entropy Passphrases ---
# A new system policy has been put in place that requires all accounts to use a
# passphrase instead of simply a password. A passphrase consists of a series of
# words (lowercase letters) separated by spaces.
#
# To ensure security, a valid passphrase must contain no duplicate words.
#
# For example:
#
# aa bb cc dd ee is valid.
# aa bb cc dd aa is not valid - the word aa appears more than once.
# aa bb cc dd aaa is valid - aa and aaa count as different words.
# The system's full passphrase list is available as your puzzle input. How many
# passphrases are valid?
#

# Parse File input
input_array = Array.new
file_name = "day_4_input.txt"
File.readlines(file_name).each do |line|
  line_array = Array.new
  lines = line.split(" ")
  lines.each do |l|
    line_array << l.to_s
  end
  input_array << line_array
end

num_valid = 0
input_array.each do |passphrase_array|
  duplicated_passphrases_list = passphrase_array.select{ |x| passphrase_array.count(x) > 1}
  if duplicated_passphrases_list.empty?
    num_valid += 1
  end
end

puts "Day 4, Solution 1: #{num_valid}"

# --- Part Two ---
# For added security, yet another system policy has been put in place. Now, a
# valid passphrase must contain no two words that are anagrams of each other -
# that is, a passphrase is invalid if any word's letters can be rearranged to
# form any other word in the passphrase.
#
# For example:
#
# abcde fghij is a valid passphrase.
# abcde xyz ecdab is not valid - the letters from the third word can be
# rearranged to form the first word.
# a ab abc abd abf abj is a valid passphrase, because all letters need to be
# used when forming another word.
# iiii oiii ooii oooi oooo is valid.
# oiii ioii iioi iiio is not valid - any of these words can be rearranged to
# form any other word.
# Under this new system policy, how many passphrases are valid?

num_valid = 0
input_array.each do |passphrase_array|
  sorted_passphrase_array = passphrase_array.map { |x| x.chars.sort.join }
  dups = sorted_passphrase_array.select{ |x| sorted_passphrase_array.count(x) > 1 }
  if dups.empty?
    num_valid += 1
  end
end

puts "Day 4, Solution 2: #{num_valid}"
