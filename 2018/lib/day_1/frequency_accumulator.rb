module Day1
  class FrequencyAccumulator
    attr_reader :input
    def initialize(input)
      @input = input
    end

    def calculate
      input.reduce(&:+)
    end

    def find_duplicate
      total = 0
      history = []
      loop do
        input.each do |element|
          total += element
          return total if history.include? total
          history << total
        end
      end
    end
  end
end
