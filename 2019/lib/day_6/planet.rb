class Planet
  attr_accessor :suns, :moons

  def initialize(name:, direct_orbits: [])
    @name = name
    @direct_orbits =  direct_orbits
    @indirect_orbits = []
  end

  def total
    direct_orbits.count + indirect_orbits.count
  end

  def update_indirect(planet)
    indirect_orbits << planet
  end
end
