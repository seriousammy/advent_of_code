class Untangle
  def initialize(path:)
    @path = path
    @pathmap = []
  end

  def call
    marker = [0, 0]
    path.each do |instruction|
      marker = decode_instruction(instruction, marker)
    end
    @pathmap
  end

  attr_reader :pathmap

  private

  attr_reader :path

  def decode_instruction(instruction, marker)
    direction = instruction.chr
    value = instruction.delete(direction).to_i
    case direction
    when 'R'
      @pathmap += (1..value).map {|step| [marker[0] + step, marker[1]] }
      [marker[0] + value, marker[1]]
    when 'L'
      @pathmap += (1..value).map {|step| [marker[0] - step, marker[1]] }
      [marker[0] - value, marker[1]]
    when 'U'
      @pathmap += (1..value).map {|step| [marker[0], marker[1] + step] }
      [marker[0], marker[1] + value]
    when 'D'
      @pathmap += (1..value).map {|step| [marker[0], marker[1] - step] }
      [marker[0], marker[1] - value]
    end
  end
end
