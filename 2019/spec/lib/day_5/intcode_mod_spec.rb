require 'day_5/intcode_mod'
require 'spec_helper'

RSpec.describe IntcodeMod do
  let(:instance) { described_class.new(num_ary: num_ary, input_code: 9) }
  let(:num_ary) {
    [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
     1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
     999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99]
  }
  describe '#diag_code' do
    it 'should return correct result' do
      instance.call
      expect(instance.diag_code).to eq 1001
    end
  end
end
