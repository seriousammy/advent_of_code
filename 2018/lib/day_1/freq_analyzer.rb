class FrequencyAnalyzer
  attr_accessor :file_name, :input_array, :total_frequency,
                :duplicate_total_frequency
  def initialize(file_name)
    @file_name = file_name
    @input_array = translate_file_input_to_array(file_name)
    @total_frequency = 0
    @duplicate_total_frequency = 0
  end

  def translate_file_input_to_array(file_name)
    input_array = Array.new
    File.readlines(file_name).each do |line|
      input_array << line.to_i
    end
    return input_array
  end

  def calculate_total_frequency()
    @input_array.each do |elem|
      @total_frequency += elem
    end
    return @total_frequency
  end

  def find_frequency_duplicate(accumulating_result_arr)
    @input_array.each do |elem|
      @duplicate_total_frequency += elem
      if accumulating_result_arr.include? @duplicate_total_frequency
        @duplicate_found = true
        return true
      end
      accumulating_result_arr << @duplicate_total_frequency
    end
    return false
  end

  def find_frequency_duplicate_repeated()
    @duplicate_found = false
    @accumulating_result_arr = Array.new
    while !@duplicate_found
      find_frequency_duplicate(@accumulating_result_arr)
    end
    return @duplicate_total_frequency

  end
end
