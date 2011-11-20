require 'spaceship_accessories/spaceship_sensors'


class SpaceshipModule
	attr_writer :sensors
  
  def initialize(energy_spent=0, fuel_spent=0, damages_spent=0)
		set_spent_or_recovery_values(energy_spent, fuel_spent, damages_spent)
		desactivate
  end

	def set_spent_or_recovery_values energy_spent=0, fuel_spent=0, damage_spent=0
		@energy_spent = energy_spent
		@fuel_spent = fuel_spent
		@damage_spent = damage_spent
	end 

	def activate
    @active = true
	end

	def module_is_active?
		@active
	end
	
	def desactivate
		@active = false
	end

	def notify_sensors
		@sensors.notify(@energy_spent,@fuel_spent,@damage_spent) if module_is_active?
	end

end
