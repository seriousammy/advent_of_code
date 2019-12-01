require 'day_3/claim'

RSpec.describe Day3::Claim do
  let(:instance) do
    described_class.new(
      id: 1,
      x: 2,
      y: 4,
      width: 2,
      height: 3
    )
  end

  describe '#coord_collection' do
    subject { instance.coord_collection }
    it { is_expected.to eq [[2, 4], [2, 5], [2, 6], [3, 4], [3, 5], [3, 6]] }
  end
end
