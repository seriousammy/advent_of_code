require 'day_1/frequency_accumulator'
require 'spec_helper'

RSpec.describe Day1::FrequencyAccumulator do
  let(:instance) { described_class.new(input) }
  let(:input) do
    [
      1,
      -2,
      3,
      1
    ]
  end

  describe '#calculate' do
    it 'should return correct result' do
      expect(instance.calculate).to eq 3
    end
  end

  describe '#find_duplicate' do
    it 'should return correct result' do
      expect(instance.find_duplicate).to eq 2
    end
  end
end
