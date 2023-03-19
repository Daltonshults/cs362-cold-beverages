class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    if vessel.volume > reservoir.current_water_volume
      vessel.fill(reservoir.current_water_volume)
      reservoir.drain(reservoir.current_water_volume)
      
    else
      vessel.fill(vessel.volume)
      reservoir.drain(vessel.volume)
    end
  end

end
