require 'day_01/day_01'
require 'spec_helper'

RSpec.describe Day01 do
  let(:instance) { described_class.new(input: input) }
  let(:input) do
    [
      1721,
      979,
      366,
      299,
      675,
      1456
    ]
  end

  subject { instance.twos(target: 2020) }

  context 'part 1' do
    it { is_expected.to eq 514_579 }
  end

  context 'part 2' do
    subject { instance.threes(target: 2020) }

    it { is_expected.to eq 241_861_950 }
  end
end
