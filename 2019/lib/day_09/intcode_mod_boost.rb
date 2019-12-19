class IntcodeModBoost
  def initialize(num_ary:, input_codes:)
    @num_ary = num_ary
    @original_ary = num_ary
    @input_codes = input_codes
    @output = []
    @relative_base = 0
  end

  def call
    transform
    return num_ary
  end

  def diag_code
    output.last
  end

  def outputs
    output
  end

  private

  attr_accessor :num_ary, :input_codes, :output, :relative_base

  def transform
    instruction_pointer = 0
    while instruction_pointer < num_ary.length do
      break if halt?(instruction_pointer)
      opcode = decode_opcode(num_ary[instruction_pointer])

      # Lets just slice 3, it doesn't matter for now...
      # But for debug purposes:
      # [1, 2, 7, 8] = 3
      # [3, 4] = 1
      # [5 ,6] = 2
      intcode = assemble_intcode(instruction_pointer, 3)

      # The following opcode has options for parameter mode
      if [1, 2, 5, 6, 7, 8].include? opcode
        param_1 = param_modes(opcode_param(intcode[0], 2), intcode[1])
        param_2 = param_modes(opcode_param(intcode[0], 3), intcode[2])
        param_1 = param_1.nil? ? 0 : param_1
        param_2 = param_2.nil? ? 0 : param_2
      end

      case opcode
      when 1
        if opcode_param(intcode[0], 4) == 2
          num_ary[intcode[3] + @relative_base] = param_1 + param_2
        else
          num_ary[intcode[3]] = param_1 + param_2
        end
        instruction_pointer += 4
      when 2
        if opcode_param(intcode[0], 4) == 2
          num_ary[intcode[3] + @relative_base] = param_1 * param_2
        else
          num_ary[intcode[3]] = param_1 * param_2
        end
        instruction_pointer += 4
      when 3
        if opcode_param(intcode[0], 2) == 2
          num_ary[intcode[1] + @relative_base] = input_codes.shift
        else
          num_ary[intcode[1]] = input_codes.shift
        end
        instruction_pointer += 2
      when 4
        if opcode_param(intcode[0], 2) == 1
          output << intcode[1]
        elsif opcode_param(intcode[0], 2) == 2
          output << num_ary[intcode[1] + @relative_base]
        else
          output << num_ary[intcode[1]]
        end
        instruction_pointer += 2
      when 5
        if param_1 != 0
          instruction_pointer = param_2
        else
          instruction_pointer += 3
        end
      when 6
        if param_1 == 0
          instruction_pointer = param_2
        else
          instruction_pointer += 3
        end
      when 7
        pos = intcode[3]
        if opcode_param(intcode[0], 4) == 2
          pos = intcode[3] + @relative_base
        end
        if param_1 < param_2
          num_ary[pos] = 1
        else
          num_ary[pos] = 0
        end

        instruction_pointer += 4
      when 8
        pos = intcode[3]
        if opcode_param(intcode[0], 4) == 2
          pos = intcode[3] + @relative_base
        end
        if param_1 == param_2
          num_ary[pos] = 1
        else
          num_ary[pos] = 0
        end
        instruction_pointer += 4
      when 9
        if opcode_param(intcode[0], 2) == 1
          @relative_base += intcode[1]
        elsif opcode_param(intcode[0], 2) == 2
          rel_base = num_ary[@relative_base + intcode[1]]
          if rel_base != nil
            @relative_base += num_ary[intcode[1] + @relative_base]
          end
        else
          @relative_base += num_ary[intcode[1]]
        end
        instruction_pointer += 2
      end
    end
  end

  def halt?(instruction_pointer)
    (num_ary[instruction_pointer] || num_ary[instruction_pointer].digits.take(2)) == 99
  end

  # Returns a slice of the number array that needs to be processed.
  def assemble_intcode(instruction_pointer, length)
    (0..length).map { |i| num_ary[instruction_pointer + i] }
  end

  # Returns the opcode
  def decode_opcode(opcode)
    return opcode if opcode.digits.length == 1
    opcode.digits[0]
  end

  # 0 : position
  # 1 : immediate
  # 2 : relative
  def opcode_param(opcode, param_position)
    begin
      opcode.digits[param_position]
    rescue
      0
    end
  end

  def param_modes(param_code, immediate_value)
    if param_code == 1
      immediate_value
    elsif param_code == 2
      num_ary[immediate_value + @relative_base]
    else
      num_ary[immediate_value]
    end
  end
end
