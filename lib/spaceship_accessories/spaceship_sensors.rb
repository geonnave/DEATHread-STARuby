

class SpaceshipSensors
  attr_accessor :energy, :fuel, :damages
	CRITICAL_ENERGY_VALUE = 500
	CRITICAL_FUEL_VALUE = 500
	CRITICAL_DAMAGE_VALUE = 9000
	
	def initialize energy=2000, fuel=2000
		@MAX_ENERGY, @energy = energy, energy
		@MAX_FUEL, @fuel = fuel, fuel
		@MAX_DAMAGES, @damages = 9000, 0
	end

	def notify energy=0, fuel=0, damages=0
		@energy += energy
		@fuel += fuel
		@damages += damages
	end

	def pct_sensors
		[percent(@energy, @MAX_ENERGY),
		 percent(@fuel, @MAX_FUEL),
		 percent(@damages, @MAX_DAMAGES)]
	end

	def percent value, total
		(value/total)*100 unless total == 0
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
		critical_damage? || critical_energy? || critical_fuel?
	end

  def to_s
    "energy: #{@energy}\nfuel: #{@fuel}\ndamages: #{@damages}\n"
  end
  
end
