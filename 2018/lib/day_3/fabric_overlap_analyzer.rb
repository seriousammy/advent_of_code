class FabricOverlapAnalyzer
  attr_accessor :file_name

  def initialize(file_name)
    @file_name = file_name
    @array_of_inputs = translate_file_to_array(file_name)
  end

  def translate_file_to_array(file_name)
    @array_of_inputs = Array.new
    File.readlines(file_name).each do |line|
      claim_number_regex = line.match(/#\d+ /)
      print claim_number_regex.captures
      puts line.scan(/@ \d+,\d+/)
      puts line.scan(/\d+x\d+/)
    end
  end
end

foa = FabricOverlapAnalyzer.new "test.txt"


