require 'day_03/untangle'
require 'spec_helper'

RSpec.describe Untangle do
  let(:instance) { described_class.new(path: num_ary) }
  let(:num_ary) { ['R8', 'U5', 'L5', 'D3'] }

  describe '#call' do
    it 'should return correct result' do
      expect(instance.call).to eq(
        [
          [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0],
          [8, 1], [8, 2], [8, 3], [8, 4], [8, 5], [7, 5], [6, 5], [5, 5],
          [4, 5], [3, 5], [3, 4], [3, 3], [3, 2]
        ]
      )
    end
  end
end
