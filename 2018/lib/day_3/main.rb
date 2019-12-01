require './claim'
collection = []

File.readlines('input.txt').each do |line|
  line_parse = line.split(' ')
  claim_id = line_parse.first
  x_y = line_parse[-2].chomp(':').split(',').map(&:to_i)
  w_h = line_parse[-1].split('x').map(&:to_i)
  collection << Day3::Claim.new(
    id: claim_id,
    x: x_y.first,
    y: x_y.last,
    width: w_h.first,
    height: w_h.last
  )
end

claim_coord_collection = collection.flat_map { |claim| claim.coord_collection }
overlap = claim_coord_collection.group_by { |coord| coord }.select { |_, v| v.length > 1 }

puts "Day 3 Part 1: #{overlap.count}"

duplicates = claim_coord_collection.select { |coord| claim_coord_collection.count(coord) > 1 }.uniq

#no_overlap_claim = collection.find { |claim|
#  (claim.coord_collection - duplicates).length == claim.coord_collection.length
#}

puts duplicates.count
#puts "Day 3 Part 2: #{no_overlap_claim.id}"
