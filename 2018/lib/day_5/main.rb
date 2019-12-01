input_array = []
File.readlines('input.txt').each do |line|
  input_array << line
end
word = input_array.first

chars = word.chars

#mod_word = chars.inject {|memo, char|
#  last_char = memo.chars.last
#  if memo == ""
#    memo = char
#  elsif last_char.downcase == char.downcase && last_char != char
#    memo.chop
#  else
#    memo + char
#  end
#}
#puts mod_word.strip.chars.count
#

letters = ('a'..'z').to_a

polymers = letters.map do |letter|
  word.delete(letter.downcase).delete(letter.upcase)
end.select {|w| w.length < word.length }

puts polymers.inspect

x = polymers.map do |word|
  word.strip.chars.inject {|memo, char|
    last_char = memo.chars.last
    if memo == ""
      memo = char
    elsif last_char.downcase == char.downcase && last_char != char
      memo.chop
    else
      memo + char
    end
  }
end
puts x.min { |a, b| a.length <=> b.length }.length

