require 'day_9/intcode_mod_boost'
require 'spec_helper'

RSpec.describe IntcodeModBoost do
  let(:instance) { described_class.new(num_ary: num_ary, input_codes: [1]) }
  let(:num_ary) {
    [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]
  }
  describe '#diag_code' do
    it 'should return correct result' do
      expect(instance.call).to eq num_ary
    end
  end
end
