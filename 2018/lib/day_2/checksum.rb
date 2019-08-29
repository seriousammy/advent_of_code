module Day2
  class CheckSum
    def initialize(input)
      @input = input
    end

    def checksum
      twos = 0
      threes = 0
      input.each do |word|
        twos += 1 if two_count(word)
        threes += 1 if three_count(word)
      end
      twos * threes
    end

    def differ_by_one_char_word
      input.each do |word|
        input.each do |word2|
          if differ_by_one_char_pos(word, word2)
            return common_letters(word, word2)
          end
        end
      end
    end

    private

    attr_reader :input

    def common_letters(word1, word2)
      word1.chars.zip(word2.chars).select { |(x, y)| x == y }.map(&:first).join('')
    end

    def differ_by_one_char_pos(word1, word2)
      word1.chars.zip(word2.chars).reject { |(x, y)| x == y }.count == 1
    end

    def two_count(word)
      word.chars.detect { |letter| word.count(letter) == 2 }
    end

    def three_count(word)
      word.chars.detect { |letter| word.count(letter) == 3 }
    end

  end
end
