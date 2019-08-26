require "./box_label_analyzer"

bla = BoxLabelAnalyzer.new "input.txt"

puts "Part 1 solution: #{bla.calculate_twice_cross_thrice_repeats}"

bla.compare_charrs_by_element
puts "Part 2 solution: #{bla.result_code}"
