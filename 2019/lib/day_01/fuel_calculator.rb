class FuelCalculator
  attr_reader :mass

  def initialize(mass:)
    @mass = mass
  end

  def initial_fuel
    fuel_calculator(mass)
  end

  def nos_fuel
    remaining_fuel = mass
    sum = 0
    while (remaining_fuel = fuel_calculator(remaining_fuel)) > 0 do
      sum += remaining_fuel
    end
    sum
  end

  private

  def fuel_calculator(mod_mass)
    ((mod_mass / 3).to_i) - 2
  end
end
