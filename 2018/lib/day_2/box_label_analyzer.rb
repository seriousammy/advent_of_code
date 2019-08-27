class BoxLabelAnalyzer
  attr_accessor :file_name, :array_of_chars_arrays, :twice_cross_thrice,
                :result_code
  def initialize(file_name)
    @file_name = file_name
    @array_of_charrs = translate_file_input_to_array_of_char(file_name)
    @twice_cross_thrice = 0
    @repeat_twice = 0
    @repeat_thrice = 0
    @first_code_arr = ""
    @second_code_arr = ""
    @result_code = ""
  end

  def translate_file_input_to_array_of_char(file_name)
    @array_of_charrs = Array.new
    File.readlines(file_name).each do |line|
      array_of_chars = line.strip.split("")
      @array_of_charrs << array_of_chars
    end
    return @array_of_charrs
  end

  def calculate_twice_cross_thrice_repeats()
    @array_of_charrs.each do |char_array|
      if char_array.detect{ |e| char_array.count(e) == 2 }
        @repeat_twice += 1
      end
      if char_array.detect{ |e| char_array.count(e) == 3 }
        @repeat_thrice += 1
      end
    end
    @twice_cross_thrice = @repeat_twice * @repeat_thrice
    return @twice_cross_thrice
  end

  def compare_charrs_by_element()
    @array_of_charrs.each do |arr|
      @array_of_charrs.each do |arr2|
        match_pts = 0
        arr.zip(arr2).map { |a, b| a == b ? match_pts += 1 : nil }
        if arr.length - match_pts  == 1
          @first_code_arr = arr
          @second_code_arr = arr2
          self.calculate_result_code()
        end
      end
    end
  end

  def calculate_result_code()
    @first_code_arr.zip(@second_code_arr).map { |a, b| a == b ?
                                               @result_code += a : nil }
  end
end
