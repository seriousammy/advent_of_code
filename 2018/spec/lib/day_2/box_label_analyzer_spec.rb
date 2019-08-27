require "./box_label_analyzer"

RSpec.describe BoxLabelAnalyzer do
  context "with a test.txt file as input" do
    before(:each) do
      @bla = BoxLabelAnalyzer.new "test.txt"
    end

    it "should give the correct class vars during initialization" do
      expect(@bla.file_name).to eq "test.txt"
    end

    it "should give the twice * thrice results" do
      expect(@bla.calculate_twice_cross_thrice_repeats()).to eq 0
    end

    it "should give the key to the two labels that are within
        one chars apart in similarity" do
      @bla.compare_charrs_by_element()
      expect(@bla.result_code).to eq "fgijfgij"
    end
  end
end
