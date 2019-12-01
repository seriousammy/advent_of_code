module Day3
  class Claim
    def initialize(id:, x:, y:, width:, height:)
      @id = id
      @x = x
      @y = y
      @width = width
      @height = height
    end

    def coord_collection
      width.times.flat_map do |i|
        height.times.map do |j|
          [x + i, y + j]
        end
      end
    end

    attr_reader :id, :x, :y, :width, :height
  end
end
