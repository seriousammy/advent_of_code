require 'day_2/checksum'

RSpec.describe Day2::CheckSum do
  let(:instance) { described_class.new(input) }
  let(:input) do
    [
      'abcdef',
      'bababc',
      'abbcde',
      'abcccd',
      'aabcdd',
      'abcdee',
      'ababab'
    ]
  end

  describe '#checksum' do
    it 'should return the correct checksum' do
      expect(instance.checksum).to eq 12
    end
  end

  describe '#do' do
    let(:input) do
      [
        'abcde',
        'fghij',
        'klmno',
        'pqrst',
        'fguij',
        'axcye',
        'wvxyz'
      ]
    end
    it 'should return the correct string' do
      expect(instance.differ_by_one_char_word).to eq 'fgij'
    end
  end
end
