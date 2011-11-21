

class SpaceshipSensors
  attr_accessor :energy, :fuel, :damages
	CRITICAL_ENERGY_VALUE = 200
	CRITICAL_FUEL_VALUE = 200
	CRITICAL_DAMAGE_VALUE = 9000
	
	def initialize energy=2000, fuel=2000
		@energy = energy
		@fuel = fuel
		@damages = 0
	end

	def notify energy=0, fuel=0, damages=0
		@energy += energy
		@fuel += fuel
		@damages += damages
	end
  
	def critical_energy?
		return @energy <= CRITICAL_ENERGY_VALUE
	end
  
	def critical_fuel?
		return @fuel <= CRITICAL_FUEL_VALUE
	end
  
	def critical_damage?
		return @damages >= CRITICAL_DAMAGE_VALUE
	end

  def to_s
    "energy: #{@energy}\nfuel: #{@fuel}\ndamages: #{@damages}\n"
  end
  
end
