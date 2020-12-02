require 'day_02/day_02'
require 'spec_helper'

RSpec.describe Day02 do
  let(:instance) { described_class.new(input: input) }
  let(:input) do
    [
      '1-3 a: abcde',
      '1-3 b: cdefg',
      '2-9 c: ccccccccc'
    ]
  end

  subject { instance.part1 }

  context 'part 1' do
    it { is_expected.to eq 2 }
  end

  context 'part 2' do
    subject { instance.part2 }

    it { is_expected.to eq 1 }
  end
end
