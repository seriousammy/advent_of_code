require "./freq_analyzer"

fa = FrequencyAnalyzer.new "input.txt"
puts "Filename: #{fa.file_name}"

puts "Result: #{fa.calculate_total_frequency()}"

puts "Find Duplicate: #{fa.find_frequency_duplicate_repeated()}"
