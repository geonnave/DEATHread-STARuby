

class SpaceshipSensors
  attr_accessor :energy, :fuel, :damages
	CRITICAL_ENERGY_VALUE = 500
	CRITICAL_FUEL_VALUE = 500
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
  
	def semi_critical_energy?
		@energy <= CRITICAL_ENERGY_VALUE
	end
  
	def semi_critical_fuel?
		@fuel <= CRITICAL_FUEL_VALUE
	end
  
	def critical_damage?
		@damages >= CRITICAL_DAMAGE_VALUE
	end

	def critical_energy?
		@energy <= 10
	end

	def critical_fuel?
		@fuel <= 10
	end

	def critical_status?
		critical_damage? || critical_energy || critical_fuel?
	end

  def to_s
    "energy: #{@energy}\nfuel: #{@fuel}\ndamages: #{@damages}\n"
  end
  
end
