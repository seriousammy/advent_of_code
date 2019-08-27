require "day_1/freq_analyzer"
require 'spec_helper'

RSpec.describe FrequencyAnalyzer do
  context "with a test.txt file as input" do
    before(:each) do
      @fa = FrequencyAnalyzer.new "test.txt"
    end

    it "should give the correct class vars during initialization" do
      expect(@fa.file_name).to eq "test.txt"
      expect(@fa.input_array).to eq [7,7,-2,-7,-4]
    end

    it "sums the input for a total" do
      total = @fa.calculate_total_frequency()
      expect(total).to eq 1
    end

    it "finds the result when the result has been duplicated" do
      duplicate_total = @fa.find_frequency_duplicate_repeated()
      expect(duplicate_total).to eq 14
    end
  end
end
