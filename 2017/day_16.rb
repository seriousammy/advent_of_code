# --- Day 16: Permutation Promenade ---
# You come upon a very unusual sight; a group of programs here appear to be
# dancing.
#
# There are sixteen programs in total, named a through p. They start by standing
# in a line: a stands in position 0, b stands in position 1, and so on until p,
# which stands in position 15.
#
# The programs' dance consists of a sequence of dance moves:
#
# Spin, written sX, makes X programs move from the end to the front, but
# maintain their order otherwise. (For example, s3 on abcde produces cdeab).
#
# Exchange, written xA/B, makes the programs at positions A and B swap places.
#
# Partner, written pA/B, makes the programs named A and B swap places.
# For example, with only five programs standing in a line (abcde), they could do
# the following dance:
#
# s1, a spin of size 1: eabcd.
# x3/4, swapping the last two programs: eabdc.
# pe/b, swapping programs e and b: baedc.
# After finishing their dance, the programs end up in order baedc.
#
# You watch the dance for a while and record their dance moves (your puzzle
# input). In what order are the programs standing after their dance?
#
def spin(size, ary)
  ary = ary.rotate(-size)
end

def exchange(pos_a, pos_b, ary)
  pos_a_val = ary[pos_a]
  pos_b_val = ary[pos_b]
  ary[pos_a] = pos_b_val
  ary[pos_b] = pos_a_val
  ary
end

def swap(prog_a, prog_b, ary)
  index_a = ary.index(prog_a)
  index_b = ary.index(prog_b)
  ary[index_a] = prog_b
  ary[index_b] = prog_a
  ary
end

program_str = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p']
#program_str = ['a','b','c','d','e']
input_array = Array.new
file_name = "day_16_input.txt"

File.readlines(file_name).each do |line|
  input_array = line.strip.split(",")
end
#input_array = ['s1', 'x3/4', 'pe/b']
input_array.each do |instruction|
  instruction_array = instruction.chars
  instruction_positions = instruction_array.drop(1).join.split("/")
  case instruction_array.first
  when "s"
    program_str = spin(instruction_positions[0].to_i, program_str)
  when "x"
    program_str = exchange(
      instruction_positions[0].to_i,
      instruction_positions[1].to_i,
      program_str
    )
  when "p"
    program_str = swap(
      instruction_positions[0],
      instruction_positions[1],
      program_str
    )
  end
end

puts "Day 16 Solution Part 1: #{program_str.join}"

# --- Part Two ---
# Now that you're starting to get a feel for the dance moves, you turn your
# attention to the dance as a whole.
#
# Keeping the positions they ended up in from their previous dance, the programs
# perform it again and again: including the first dance, a total of one billion
# (1000000000) times.
#
# In the example above, their second dance would begin with the order baedc, and
# use the same dance moves:
#
# s1, a spin of size 1: cbaed.
# x3/4, swapping the last two programs: cbade.
# pe/b, swapping programs e and b: ceadb.
# In what order are the programs standing after their billion dances?
#
#
