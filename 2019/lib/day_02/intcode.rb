class Intcode
  def initialize(num_ary:)
    @num_ary = num_ary
    @original_ary = num_ary
  end

  def call
    transform
    return num_ary
  end

  private

  attr_accessor :num_ary

  def transform
    num_ary.each_slice(4) do |intcode|
      break if intcode.first == 99
      opcode_ex(intcode)
    end
  end

  def opcode_ex(intcode)
    case intcode[0]
    when 1
      num_ary[intcode[3]] = num_ary[intcode[1]] + num_ary[intcode[2]]
    when 2
      num_ary[intcode[3]] = num_ary[intcode[1]] * num_ary[intcode[2]]
    end
  end
end
