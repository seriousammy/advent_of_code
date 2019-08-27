require 'input_to_array'
require 'spec_helper'

RSpec.describe InputToArray do
  let(:instance) { described_class.new('./test.txt')}

  describe '#transalte_file_input_to_array' do
    it { expect(instance.file_name).to eq "test.txt" }
  end
end
