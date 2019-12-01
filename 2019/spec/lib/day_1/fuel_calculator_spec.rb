require 'day_1/fuel_calculator'
require 'spec_helper'

RSpec.describe FuelCalculator do
  let(:instance) { described_class.new(mass: mass) }
  let(:mass) { 100756 }

  describe '#initial_fuel' do
    it 'should return correct result' do
      expect(instance.initial_fuel).to eq 33583
    end
  end

  describe '#nos_fuel' do
    it 'should return correct result' do
      expect(instance.nos_fuel).to eq 50346
    end
  end
end
