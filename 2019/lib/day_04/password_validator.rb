class PasswordValidator
  def initialize(password:)
    @password = password
    @range = [128392, 643281]
  end

  def valid?
    six_digits? && within_range? && two_adjacent_digits? && increasing?
  end

  def part_2_valid?
    six_digits? && within_range? && exactly_two_adjacent_digits? && increasing?
  end

  private

  attr_reader :range, :password

  def six_digits?
    password.digits.length == 6
  end

  def within_range?
    (range[0]..range[1]).include? password
  end

  def two_adjacent_digits?
    password.digits.chunk_while { |i,j| i == j }.select { |chunk| chunk.length > 1 }.any?
  end

  def exactly_two_adjacent_digits?
    password.digits.chunk_while { |i,j| i == j }.select { |chunk| chunk.length == 2 }.any?
  end

  def increasing?
    password.digits.chunk_while { |i,j| i >= j }.select { |chunk| chunk.length == 6 }.any?
  end
end
