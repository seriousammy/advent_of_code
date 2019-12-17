require 'day_9/intcode_boost_mod'
require 'spec_helper'

RSpec.describe IntcodeMod do
  let(:instance) { described_class.new(num_ary: num_ary) }
  let(:num_ary) {
    [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]
  }
  describe '#diag_code' do
    it 'should return correct result' do
      instance.call
      expect(instance.diag_code).to eq num_ary
    end
  end
end
