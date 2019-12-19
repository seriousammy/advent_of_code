require 'day_05/intcode_mod'
require 'spec_helper'

RSpec.describe IntcodeMod do
  let(:instance) { described_class.new(num_ary: num_ary, input_code: input) }
  let(:input) { 8 }
  let(:num_ary) {
    [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
     1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
     999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99]
  }
  describe '#diag_code' do
    it 'should return correct result' do
      instance.call
      expect(instance.diag_code).to eq 1000
    end

    context 'input is less than 8' do
      let(:input) { 7 }
      it 'should return correct result' do
        instance.call
        expect(instance.diag_code).to eq 999
      end
    end

    context 'input is greater than 8' do
      let(:input) { 9 }
      it 'should return correct result' do
        instance.call
        expect(instance.diag_code).to eq 1001
      end
    end

    context 'position mode test 1' do
      let(:input) { 8 }
      let(:num_ary) {
        [3,9,8,9,10,9,4,9,99,-1,8]
      }
      it 'should return correct result' do
        instance.call
        expect(instance.diag_code).to eq 1
      end
    end

    context 'position mode test 2' do
      let(:input) { 7 }
      let(:num_ary) {
        [3,9,8,9,10,9,4,9,99,-1,8]
      }
      it 'should return correct result' do
        instance.call
        expect(instance.diag_code).to eq 0
      end
    end

    context 'immediate mode test 1' do
      let(:input) { 8 }
      let(:num_ary) {
        [3,3,1108,-1,8,3,4,3,99]
      }
      it 'should return correct result' do
        instance.call
        expect(instance.diag_code).to eq 1
      end
    end

    context 'immediate mode test 2' do
      let(:input) { 7 }
      let(:num_ary) {
        [3,3,1108,-1,8,3,4,3,99]
      }
      it 'should return correct result' do
        instance.call
        expect(instance.diag_code).to eq 0
      end
    end

    context 'jump-test position mode 1' do
      let(:input) { 0 }
      let(:num_ary) {
        [3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9]
      }
      it 'should return correct result' do
        instance.call
        expect(instance.diag_code).to eq 0
      end
    end

    context 'jump-test position mode 2' do
      let(:input) { 1 }
      let(:num_ary) {
        [3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9]
      }
      it 'should return correct result' do
        instance.call
        expect(instance.diag_code).to eq 1
      end
    end

    context 'jump-test immediate mode 1' do
      let(:input) { 0 }
      let(:num_ary) {
        [3,3,1105,-1,9,1101,0,0,12,4,12,99,1]
      }
      it 'should return correct result' do
        instance.call
        expect(instance.diag_code).to eq 0
      end
    end

    context 'jump-test immediate mode 2' do
      let(:input) { 1 }
      let(:num_ary) {
        [3,3,1105,-1,9,1101,0,0,12,4,12,99,1]
      }
      it 'should return correct result' do
        instance.call
        expect(instance.diag_code).to eq 1
      end
    end
  end
end
