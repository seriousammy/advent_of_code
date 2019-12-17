require 'intcode/master_intcode'
require 'spec_helper'

RSpec.describe MasterIntcode do
  context 'day 2 test' do
    let(:instance) { described_class.new(num_ary: num_ary, input_codes: [0]) }
    let(:num_ary) { [] }

    describe '#call' do
      let(:num_ary) { [1, 1, 1, 4, 99, 5, 6, 0, 99] }

      it 'should return correct result' do
        expect(instance.call).to eq [30, 1, 1, 4, 2, 5, 6, 0, 99]
      end
    end
  end

  context 'day 5 tests' do
    let(:instance) { described_class.new(num_ary: num_ary, input_codes: [input]) }
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
  context 'day 9 test' do
    let(:instance) { described_class.new(num_ary: num_ary, input_codes: [0]) }
    let(:num_ary) { [] }

    describe '#call' do
      let(:num_ary) { [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99] }

      it 'should return correct result' do
        instance.call
        expect(instance.outputs).to eq [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]
      end

      context 'boost-test 2' do
        let(:num_ary) {
          [1102, 34915192,34915192, 7, 4, 7, 99, 0]
        }
        it 'should return correct result' do
          instance.call
          expect(instance.diag_code.digits.length).to eq 16
        end
      end

      context 'boost-test 3' do
        let(:num_ary) {
          [104, 1125899906842624, 99]
        }
        it 'should return correct result' do
          instance.call
          expect(instance.diag_code).to eq 1125899906842624
        end
      end
    end
  end
end
