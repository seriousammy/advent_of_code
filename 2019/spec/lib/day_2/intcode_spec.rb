require 'day_2/intcode'
require 'spec_helper'

RSpec.describe Intcode do
  let(:instance) { described_class.new(num_ary: num_ary) }
  let(:num_ary) { [1, 1, 1, 4, 99, 5, 6, 0, 99] }

  describe '#call' do
    it 'should return correct result' do
      expect(instance.call).to eq [30, 1, 1, 4, 2, 5, 6, 0, 99]
    end
  end
end
