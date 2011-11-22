require './spaceship_accessories/spaceship_sensors'


class SpaceshipModule
	attr_writer :sensors
  
  def initialize(energy_spent=0, fuel_spent=0, damage_spent=0)
		@energy_spent = energy_spent
		@fuel_spent = fuel_spent
		@damage_spent = damage_spent
		desactivate
  end

	def activate
    @active = true
	end
	
	def desactivate
		@active = false
	end

	def module_is_active?
		@active
	end

	def notify_sensors
		@sensors.notify(@energy_spent,@fuel_spent,@damage_spent) if module_is_active?
	end
  
end
