

class SpaceshipSensors
#	CLOCK
#	class Time
#		def to_ms
#			(self.to_f * 1000.0).to_i
#		end
#	end
#	Time.now.to_a[4]
	CRITICAL_ENERGY_VALUE = 1
	CRITICAL_FUEL_VALUE = 10
	CRITICAL_DAMAGE_VALUE = 90
	
	def initialize energy=2, fuel=1, damages=1
		@initial_clock  = clock
		@energy = energy
		@fuel = fuel
		@damages = damages
	end

	def clock
		Time.now.to_ms*CLOCK
	end

	def elapsed_time
		clock - @initial_clock
	end
	
	def notify energy=0, fuel=0, damages=0

		@energy += energy
		@fuel += fuel
		@damages += damages
	end
	def critical_energy?
		return @energy == CRITICAL_ENERGY_VALUE
	end
	def critical_fuel?
		return @fuel == CRITICAL_FUEL_VALUE
	end
	def critical_damage?
		return @damages == CRITICAL_DAMAGE_VALUE
	end
	def system_clock_time

	end
end
