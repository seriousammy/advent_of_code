require 'day_4/password_validator'
require 'spec_helper'

RSpec.describe PasswordValidator do
  let(:instance) { described_class.new(password: password) }
  let(:password) { 128899 }

  describe '#valid?' do
    it 'should return correct result' do
      expect(instance.valid?).to eq(true)
    end
  end

  describe '#part_2_valid?' do
    it 'should return correct result' do
      expect(instance.part_2_valid?).to eq(true)
    end
  end
end
