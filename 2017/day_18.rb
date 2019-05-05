# --- Day 18: Duet ---
# You discover a tablet containing some strange assembly code labeled simply "Duet". Rather than bother the sound card with it, you decide to run the code yourself. Unfortunately, you don't see any documentation, so you're left to figure out what the instructions mean on your own.
#
# It seems like the assembly is meant to operate on a set of registers that are each named with a single letter and that can each hold a single integer. You suppose each register should start with a value of 0.
#
# There aren't that many instructions, so it shouldn't be hard to figure out what they do. Here's what you determine:
#
# snd X plays a sound with a frequency equal to the value of X.
# set X Y sets register X to the value of Y.
# add X Y increases register X by the value of Y.
# mul X Y sets register X to the result of multiplying the value contained in register X by the value of Y.
# mod X Y sets register X to the remainder of dividing the value contained in register X by the value of Y (that is, it sets X to the result of X modulo Y).
# rcv X recovers the frequency of the last sound played, but only when the value of X is not zero. (If it is zero, the command does nothing.)
# jgz X Y jumps with an offset of the value of Y, but only if the value of X is greater than zero. (An offset of 2 skips the next instruction, an offset of -1 jumps to the previous instruction, and so on.)
# Many of the instructions can take either a register (a single letter) or a number. The value of a register is the integer it contains; the value of a number is that number.
#
# After each jump instruction, the program continues with the instruction to which the jump jumped. After any other instruction, the program continues with the next instruction. Continuing (or jumping) off either end of the program terminates it.
#
# For example:
#
# set a 1
# add a 2
# mul a a
# mod a 5
# snd a
# set a 0
# rcv a
# jgz a -1
# set a 1
# jgz a -2
# The first four instructions set a to 1, add 2 to it, square it, and then set it to itself modulo 5, resulting in a value of 4.
# Then, a sound with frequency 4 (the value of a) is played.
# After that, a is set to 0, causing the subsequent rcv and jgz instructions to both be skipped (rcv because a is 0, and jgz because a is not greater than 0).
# Finally, a is set to 1, causing the next jgz instruction to activate, jumping back two instructions to another jump, which jumps again to the rcv, which ultimately triggers the recover operation.
# At the time the recover operation is executed, the frequency of the last sound played is 4.
#
# What is the value of the recovered frequency (the value of the most recently played sound) the first time a rcv instruction is executed with a non-zero value?
#
class Register
  attr_accessor :register, :value, :last_sound_played

  def initialize(register)
    @register = register
    @value = 0
    @last_sound_played = 0
  end

  def set(r)
    @value = r
  end

  def add(r)
    @value += r
  end

  def mul(r)
    @value *= r
  end

  def mod(r)
    @value %= r
  end

  def rcv(sound_value)
    if @value != 0
      @value = sound_value
    end
  end
end

class Instructions
  attr_accessor :current_position, :instructions

  def initialize(array_of_instructions)
    @instructions = array_of_instructions
    @current_position = 0
  end

  def jgz(value, offset)
    if value > 0
      @current_position = @current_position + offset
    else
      return false
    end

  end

  def length
    @instructions.length
  end

  def instruction
    @instructions[@current_position]
  end

  def step
    @current_position += 1
  end

end

class Instruction
  attr_accessor :instruction_str, :arg_1, :arg_2
  def initialize(instruction_str, arg_1, arg_2)
    @instruction_str = instruction_str
    @arg_1 = arg_1
    @arg_2 = arg_2
  end
end

file_name = "day_18_input.txt"
instructions_array = Array.new
instructions_register = Array.new
snd_array = Array.new
last_sound_played = nil
File.readlines(file_name).each do |line|
  line_array = line.split(" ")
  instructions_array << Instruction.new(line_array[0], line_array[1], line_array[2])
  register = line_array[1].ord
  if instructions_register[register] == nil
    instructions_register[register] = Register.new(register)
  end
end

instructions = Instructions.new(instructions_array)

while instructions.length > instructions.current_position and
    instructions.current_position >= 0 do
  # Read current position instruction
  instruction = instructions.instruction
  # Get instruction and args
  instruction_str = instruction.instruction_str
  arg_1 = instruction.arg_1.ord
  arg_2 = instruction.arg_2

  # Get the register to update
  register = instructions_register[arg_1.ord]

  # Convert arg 2 depending on value or alpha
  if arg_2
    begin
      Float(arg_2)
      arg_2 = arg_2.to_i
    rescue
      arg_2 = instructions_register[arg_2.ord].value
    end
  end
  # Execute proper instruction
  case instruction_str
  when 'snd'
    last_sound_played = register.value
  when 'set'
    register.set(arg_2)
  when 'add'
    register.add(arg_2)
  when 'mul'
    register.mul(arg_2)
  when 'mod'
    register.mod(arg_2)
  when 'rcv'
    if register.value != 0
      register.rcv(last_sound_played)
      snd_array << register.value
      break
    else
      register.rcv(last_sound_played)
    end
  end

  if instruction_str == 'jgz'
    instructions.step unless instructions.jgz(instructions_register[arg_1].value, arg_2)
  else
    instructions.step
  end
end

puts "Day 18 Solution 1: #{snd_array.first}"
