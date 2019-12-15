require_relative './intcode_mod_amp'

input_array = File.readlines('input.txt').first.strip.split(',').map(&:to_i)

#input_array = [3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0]
#input_array = [3,23,3,24,1002,24,10,24,1002,23,-1,23,
#101,5,23,23,1,24,23,23,4,23,99,0,0]
#input_array = [3,31,3,32,1002,32,10,32,1001,31,-2,31,1007,31,0,33,
#1002,33,7,33,1,33,31,31,1,32,31,31,4,31,99,0,0,0]

signals = [0, 1, 2, 3, 4].permutation.map do |permutation|
  output = 0
  permutation.each do |num|
    amp = IntcodeModAmp.new(num_ary: input_array.dup, input_code: [num, output])
    amp.call
    output = amp.diag_code
  end
  output
end

puts "Day 7 Part 1 Solution: #{signals.max}"
