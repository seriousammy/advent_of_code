class InputToArray
  attr_reader :file_name, :input_array
  def initialize(file_name)
    @file_name = file_name
    @input_array = translate_file_input_to_array
  end

  def translate_file_input_to_array(to_type = :to_i)
    input_array = []
    File.readlines(file_name).each do |line|
      input_array << line.send(:to_i)
    end
    input_array
  end
end
