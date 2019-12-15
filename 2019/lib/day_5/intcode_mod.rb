class IntcodeMod
  def initialize(num_ary:, input_code:)
    @num_ary = num_ary
    @original_ary = num_ary
    @input_code = input_code
    @output = []
  end

  def call
    transform
    return num_ary
  end

  def diag_code
    output.last
  end

  private

  attr_accessor :num_ary, :input_code, :output

  def transform
    instruction_pointer = 0
    while instruction_pointer < num_ary.length do
      break if (num_ary[instruction_pointer] || num_ary[instruction_pointer].digits.take(2)) == 99
      decoded_opcode = decode_opcode(num_ary[instruction_pointer])
      if [3, 4].include? decoded_opcode
        opcode_ex(assemble_intcode(instruction_pointer, 1))
        instruction_pointer += 2
      elsif [5, 6].include? decoded_opcode
        instruction_pointer = opcode_parameter_adjust(assemble_intcode(instruction_pointer, 2), instruction_pointer)
      else
        opcode_ex(assemble_intcode(instruction_pointer, 3))
        instruction_pointer += 4
      end
    end
  end

  def assemble_intcode(instruction_pointer, length)
    (0..length).map { |i| num_ary[instruction_pointer + i] }
  end

  def decode_opcode(opcode)
    return opcode if opcode.digits.length == 1
    opcode.digits[0]
  end

  def opcode_parameter_adjust(intcode, instruction_pointer)
    opcode = decode_opcode(intcode[0])
    param_1 = opcode_param(intcode[0], 2) == 1 ? intcode[1] : num_ary[intcode[1]]
    param_2 = opcode_param(intcode[0], 3) == 1 ? intcode[2] : num_ary[intcode[2]]

    case opcode
    when 5
      if param_1 != 0
        instruction_pointer = param_2
      else
        instruction_pointer = instruction_pointer + 3
      end
    when 6
      if param_1 == 0
        instruction_pointer = param_2
      else
        instruction_pointer = instruction_pointer + 3
      end
    end
    instruction_pointer
  end

  def opcode_ex(intcode)
    opcode = decode_opcode(intcode[0])
    if [1, 2, 7, 8].include? opcode
      param_1 = opcode_param(intcode[0], 2) == 1 ? intcode[1] : num_ary[intcode[1]]
      param_2 = opcode_param(intcode[0], 3) == 1 ? intcode[2] : num_ary[intcode[2]]
    end

    case opcode
    when 1
      num_ary[intcode[3]] = param_1 + param_2
    when 2
      num_ary[intcode[3]] = param_1 * param_2
    when 3
      num_ary[intcode[1]] = input_code
    when 4
      if opcode_param(intcode[0], 2) == 1
        output << intcode[1]
      else
        output << num_ary[intcode[1]]
      end
    when 7
      if param_1 < param_2
        num_ary[intcode[3]] = 1
      else
        num_ary[intcode[3]] = 0
      end
    when 8
      if param_1 == param_2
        num_ary[intcode[3]] = 1
      else
        num_ary[intcode[3]] = 0
      end
    end
  end

  def opcode_param(opcode, param_position)
    begin
      opcode.digits[param_position]
    rescue
      0
    end
  end
end
